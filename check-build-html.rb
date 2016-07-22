require "jekyll"
require "html-proofer"

$site_source_dir = ARGV[0]
$site_dest_dir = ARGV[1]
$target_range = ARGV[2]

$proofer_runner = HTMLProofer::Runner.new([$site_dest_dir], {
    :type => :directory,
    :check_html => true,
    :allow_hash_href => true,
    :url_ignore => [
        /example\.com/,
        /https:\/\/github\.com\/myuser\/myrepo/,
        /robosnap\.net/,
        /https:\/\/github.com\/ev3dev\/ev3dev\.github\.io\/edit\/.*/,
        /warmcat\.com/,
        /robosnap\.net/,
        /01\.org/
    ]
})

begin
    $proofer_runner.run
rescue => e
    puts e.message
end

failures = $proofer_runner.instance_variable_get :@failures

changed_dest_files = []
if $target_range
    $site = Jekyll::Site.new(Jekyll.configuration({
        "source" => $site_source_dir + "/",
        "config" => $site_source_dir + "/_config.yml",
        "destination" => $site_dest_dir,
        "safe" => true
    }))
    $site.read

    $jekyll_file_map = {}
    def save_entity_mapping(jekyll_entity)
        current_dest_file = File.expand_path(jekyll_entity.destination $site.dest)
        $jekyll_file_map[File.expand_path(jekyll_entity.path)] = current_dest_file
    end

    $site.pages.each do |page|
        save_entity_mapping page
    end

    $site.posts.docs.each do |post|
        save_entity_mapping post
    end

    $site.static_files.each do |file|
        save_entity_mapping file
    end

    changed_source_files = `git -C "#{$site_source_dir}" diff --name-only #{$target_range} --`.split("\n")
    changed_dest_files = changed_source_files.map { |file| $jekyll_file_map[File.expand_path(file)] }.compact
end

fatal_failures = failures.select { |failure| !$target_range || (changed_dest_files.include? File.expand_path(failure.path)) }

if fatal_failures.empty?
    puts "No fatal failures found. There may be non-fatal failures printed above."
    exit 0
else
    puts "The following fatal failures were found:"
    fatal_failures.each do |failure|
        puts "\t" + failure.to_s
    end
    exit 1
end