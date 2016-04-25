---
title: Connecting to the Internet via Bluetooth
subject: Networking
---

{% include icon.html type="info" %}
If you do not need to access the Internet from the EV3 brick, consider
using [tethering]{: .alert-link} instead.
{: .alert .alert-info}

[tethering]: /docs/tutorials/using-bluetooth-tethering

{% include icon.html type="warning" %}
These instructions are for [brickman v0.7.0](/news/2015/12/15/Package-Release/){: .alert-link}.
If you are using an older version, please upgrade.
{: .alert .alert-warning}

*   {: tab="Android"}{% include icon.html type="info" %}
    These instructions were written using Android 4.1.2 but they should work for
    other versions as well.
    {: .alert .alert-info}

    1.  On the EV3, first verify that Bluetooth is powered on. In brickman,
        open the *Wireless and Networks* menu and select *Bluetooth*. Make sure the
        *Powered* checkbox is checked. The Bluetooth icon next to the battery in the
        status bar also indicates that Bluetooth is powered on. Furthermore, make sure
        the *Visible* box is checked to make the EV3 discoverable.

        {% include screenshot.html source="/images/brickman/bluetooth-powered-visible-no-devices.png" %}

    2.  On your Android device, open *System settings* and make sure *Bluetooth* is
        turned on.

        {% include screenshot.html source="/images/android/4.1.2/settings-bluetooth-on.png" %}

    3.  Then go to *Tethering & Mobile Hotspot* and turn on *Bluetooth tethering*

        {% include screenshot.html source="/images/android/4.1.2/tethering-enabled.png" %}

    4.  Go back to *Settings* and open *Bluetooth* and select your EV3 to pair it.

        {% include screenshot.html source="/images/android/4.1.2/searching.png" %}

    5.  Confirm the passkey on both devices when requested.

        {% include screenshot.html source="/images/android/4.1.2/pairing-request.png" %}
        {% include screenshot.html source="/images/brickman/bluetooth-droid4-confirm-passkey.png" %}

    6.  On the EV3, find your Android in the list of Bluetooth devices and and select it.

        {% include screenshot.html source="/images/brickman/bluetooth-droid4-selected.png" %}

    7.  You should have a *Network Connection* button. Select it to
        open the network connection settings. (You can also find the connection
        in *Wireless and Networks > All Network Connections*.)

        {% include screenshot.html source="/images/brickman/bluetooth-droid4-network-connection-selected.png" %}

        {% include icon.html type="info" %}
        The *Connect* button pictured above is used to connect other Bluetooth
        services. It **will not** connect the network connection. We need to use
        *Connect* on the *Network Connection* screen below instead.
        {: .alert .alert-info}

    8.  Then select *Connect*.

        {% include screenshot.html source="/images/brickman/networking-droid4-connect-selected.png" %}

    9.  *State* should change to *Online*. The Bluetooth icon will also indicate
        that you are connected and the IP address will be displayed at the top
        of the screen.

        {% include screenshot.html source="/images/brickman/networking-droid4-connect-selected-online.png" %}

    10. For `ssh` access to the EV3 on Android, you can use an app called [ConnectBot].

        Run ConnectBot and start a new connection. Do this by entering `robot@<ip-address>`
        where `<ip-address>` is the one seen on the EV3. Then press Enter on the keyboard
        to connect.

        {% include icon.html type="info" %}
        Ignore `root` in the screenshot. It is from an older version of ev3dev.
        `robot` is the correct user name.
        {: .alert .alert-info}

        {% include screenshot.html source="/images/android/4.1.2/connectbot-1.png" %}

        {% include icon.html type="info" %}
        If you have never connected before, you will prompted to confirm the
        authenticity of the host, so select *Yes* when prompted.
        {% include screenshot.html source="/images/android/4.1.2/connectbot-2.png" %}
        {: .alert .alert-info}

    11. Enter your password. The default password is `maker`.

        {% include screenshot.html source="/images/android/4.1.2/connectbot-3.png" %}

    12. And you should be connected.

        {% include screenshot.html source="/images/android/4.1.2/connectbot-4.png" %}


    [ConnectBot]: https://connectbot.org/

*   {: tab="Mac OSX"}{% include icon.html type="info" %}
    These instructions were written using OS X 10.10 but should work for other versions as well.
    {: .alert .alert-info}

    1.  On the EV3, first verify that Bluetooth is powered on. In brickman,
        open the *Wireless and Networks* menu and select *Bluetooth*. Make sure the
        *Powered* checkbox is checked. The Bluetooth icon next to the battery in the
        status bar also indicates that Bluetooth is powered on. (*Visible* doesn't
        actually matter here.)

        {% include screenshot.html source="/images/brickman/bluetooth-powered-visible-no-devices.png" %}

    2.  On your host computer, open *System Preferences* and go to *Bluetooth*. This
        will make your host computer discoverable.

        {% include screenshot.html source="/images/osx/10.10/System-Preferences-Bluetooth.png" %}

    3.  On the EV3, select *Start Scan* on the *Bluetooth* menu. It should find your
        computer.

        {% include screenshot.html source="/images/brickman/bluetooth-powered-my-computer.png" %}

    4.  Select your computer from the menu and then select the *Pair* button.

        {% include screenshot.html source="/images/brickman/bluetooth-my-computer-not-paired.png" %}

    5.  Confirm the passkey on both devices when requested.

        {% include screenshot.html source="/images/brickman/bluetooth-confirm-passkey.png" %}
        {% include screenshot.html source="/images/osx/10.10/Pairing-Request.png" %}

    6.  On your Mac, in *System Preferences*, go back and select *Network*.

        {% include screenshot.html source="/images/osx/10.9/SystemPreferencesNetwork.png" %}

    7.  If you do not already have a Bluetooth PAN device, click on the `+`
        icon in the lower left area to add a new network device. You'll need to
        select *Bluetooth PAN* in the drop down box. Click *Create* when you are done.

        {% include screenshot.html source="/images/osx/10.10/System-Preferences-Network-Add-PAN.png" %}

    8.  You may or may not see your EV3 listed next to *Device:* as shown. If you don't
        see it, don't worry, that is normal. Click *Apply* to save your
        changes, but don't connect yet. In fact, don't try to use the *Connect*
        button you see here. It is for [tethering] and won't work for the connection
        we are setting up here. Instead, we will initiate the connection from the
        EV3 itself later.

        {% include screenshot.html source="/images/osx/10.10/System-Preferences-Network-Bluetooth-PAN.png" %}

    9.  To share our Internet connection with the EV3. Go back to *System
        Preferences* and select *Sharing*.

        {% include screenshot.html source="/images/osx/10.9/SystemPreferencesSharing.png" %}

    10. Click *Internet Connection* on the left, but don't check the box yet. On
        the right, *Share your connection from:* will be *Wi-Fi* (or *Ethernet* if
        you have a wired connection). Then check the box next to *Bluetooth PAN*

        {% include screenshot.html source="/images/osx/10.10/System-Preferences-Sharing-Bluetooth-PAN.png" %}

    11. Now check the box next to *Internet Connection* on the left to enable it.
        Read the warning and then click *Start*.

        {% include screenshot.html source="/images/osx/10.9/Sharing-Internet-Connection-Warning.png" %}

    12. Back on the EV3, you should have a *Network Connection* button. Select it to
        open the network connection settings. (You can also find the connection
        in *Wireless and Networks > All Network Connections*.)

        {% include screenshot.html source="/images/brickman/bluetooth-my-computer-0-network-connection-selected.png" %}

        {% include icon.html type="info" %}
        The *Connect* button pictured above is used to connect other Bluetooth
        services. It **will not** connect the network connection. We need to use
        *Connect* on the *Network Connection* screen below instead.
        {: .alert .alert-info}

    13. Select *Connect* here. You can also check the box for *Connect automatically*.
        This way you don't have to connect manually after you reboot.

        {% include screenshot.html source="/images/brickman/networking-my-computer-0-connect-selected.png" %}

    14. *State* should change to *Online* to indicate that the EV3 has an Internet
        connection.

        {% include screenshot.html source="/images/brickman/networking-my-computer-0-disconnect-selected-online.png" %}

    15. For `ssh` access to the EV3 under OS X, you can use the good old `ssh`
        program in Terminal. In a terminal, run the following command.

            ssh robot@ev3dev.local

        <div class="panel panel-info">
        <div class="panel-heading">
        {% include icon.html type="info" %}
        If you have never connected before, you will prompted to confirm the
        authenticity of the host, so type `yes` when prompted.
        </div>
        <div class="panel-body">
        <pre>
            The authenticity of host 'ev3dev.local (192.168.2.3)' can't be established.
            RSA key fingerprint is xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx.
            Are you sure you want to continue connecting (yes/no)? yes
            Warning: Permanently added '192.168.2.3' (RSA) to the list of known hosts.
        </pre>
        </div>
        </div>

    16. Enter your password. The default password is `maker`.

            robot@ev3dev's password: 
                         _____     _
               _____   _|___ /  __| | _____   __
              / _ \ \ / / |_ \ / _` |/ _ \ \ / /
             |  __/\ V / ___) | (_| |  __/\ V /
              \___| \_/ |____/ \__,_|\___| \_/
            
            Debian jessie on LEGO MINDSTORMS EV3!
            
            The programs included with the Debian GNU/Linux system are free software;
            the exact distribution terms for each program are described in the
            individual files in /usr/share/doc/*/copyright.
            
            Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
            permitted by applicable law.
            robot@ev3dev:~$ 

*   {: tab="Ubuntu"}{% include icon.html type="info" %}
    These instructions were written using Ubuntu 14.04 and the default desktop.
    It should work for other versions of Ubuntu, derivatives of Ubuntu and
    desktop environments as well.
    {: .alert .alert-info}

    1.  The default Bluetooth and network settings in Ubuntu do not have support for
        this, so first you need to install `blueman` on your host computer.

            sudo apt-get install blueman

        {% include icon.html type="info" %}
        The default Ubuntu Unity desktop does not show the `blueman-applet`
        icon in the notification tray. If you would like to enable this, please see
        [this](http://askubuntu.com/questions/574460/blueman-indicator-missing){: .alert-link}.
        {: .alert .alert-info}

    2.  Run `blueman-services` from a terminal. (Or if you have the tray icon,
        right-click on it and choose "Local Services...")

    3.  Go to network. Ensure you activated *Network Access Point (NAP)* and
        *dnsmasq*. For *PAN support* choose *NetworkManager* but for *DUN-support*
        choose *Blueman*. Then click *Close*.

        {% include screenshot.html source="/images/ubuntu/15.10/blueman-services-network.png" %}

        {% include icon.html type="info" %}
         If your EV3 is already paired, you will need to remove it and pair it
        again so that it will see the new network service.
        {: .alert .alert-info}

    4.  On the EV3, first verify that Bluetooth is powered on. In brickman,
        open the *Wireless and Networks* menu and select *Bluetooth*. Make sure the
        *Powered* checkbox is checked. The Bluetooth icon next to the battery in the
        status bar also indicates that Bluetooth is powered on.

        {% include screenshot.html source="/images/brickman/bluetooth-powered-visible-no-devices.png" %}

    5.  On your host computer, make sure Bluetooth is powered on and visible.

        {% include screenshot.html source="/images/ubuntu/15.10/bluetooth-app-indicator-powered-visible.png" %}

    6.  On the EV3, select *Start Scan* on the *Bluetooth* menu. It should find your
        computer.

        {% include screenshot.html source="/images/brickman/bluetooth-powered-my-computer.png" %}

    7.  Select your computer from the menu and then select the *Pair* button.

        {% include screenshot.html source="/images/brickman/bluetooth-my-computer-not-paired.png" %}

    8.  Confirm or enter the passkey if requested. The exact behavior here will
        depend on the Bluetooth adapter on your host computer.

        {% include screenshot.html source="/images/brickman/bluetooth-confirm-passkey.png" %}

    12. You should have a *Network Connection* button. Select it to
        open the network connection settings. (You can also find the connection
        in *Wireless and Networks > All Network Connections*.)

        {% include screenshot.html source="/images/brickman/bluetooth-my-computer-0-network-connection-selected.png" %}

        {% include icon.html type="info" %}
        The *Connect* button pictured above is used to connect other Bluetooth
        services. It **will not** connect the network connection. We need to use
        *Connect* on the *Network Connection* screen below instead.
        {: .alert .alert-info}

    13. Select *Connect* here. You can also check the box for *Connect automatically*.
        This way you don't have to connect manually after you reboot.

        {% include screenshot.html source="/images/brickman/networking-my-computer-0-connect-selected.png" %}

    14. *State* should change to *Online* to indicate that the EV3 has an Internet
        connection.

        {% include screenshot.html source="/images/brickman/networking-my-computer-0-disconnect-selected-online.png" %}

    11. Now we are going to connect to the EV3 using ssh. In a terminal, run the
        following command.

            ssh robot@ev3dev.local

        <div class="panel panel-info">
        <div class="panel-heading">
        {% include icon.html type="info" %}
        If you have never connected before, you will prompted to confirm the
        authenticity of the host, so type `yes` when prompted.
        </div>
        <div class="panel-body">
        <pre>
            The authenticity of host '10.25.9.98 (10.25.9.98)' can't be established.
            ECDSA key fingerprint is be:9e:66:8b:d1:14:b8:8a:ea:4c:6e:07:2d:d9:68:05.
            Are you sure you want to continue connecting (yes/no)? yes
            Warning: Permanently added '10.25.9.98' (ECDSA) to the list of known hosts.
        </pre>
        </div>
        </div>

    12. Enter your password when prompted. The default password is `maker`.

            robot@ev3dev's password: 
                         _____     _
               _____   _|___ /  __| | _____   __
              / _ \ \ / / |_ \ / _` |/ _ \ \ / /
             |  __/\ V / ___) | (_| |  __/\ V /
              \___| \_/ |____/ \__,_|\___| \_/
            
            Debian jessie on LEGO MINDSTORMS EV3!
            
            The programs included with the Debian GNU/Linux system are free software;
            the exact distribution terms for each program are described in the
            individual files in /usr/share/doc/*/copyright.
            
            Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
            permitted by applicable law.
            robot@ev3dev:~$ 

*   {: tab="Windows"}__HELP WANTED!__ See [issue #287](https://github.com/ev3dev/ev3dev/issues/287).
{: tab-list="os"}
