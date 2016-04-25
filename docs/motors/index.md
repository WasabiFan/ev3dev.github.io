---
title: Motors
subtitle: And everything else that plugs into output ports on the EV3
---

* Table of Contents
{:toc}

The EV3 has four output ports for connecting motors and other devices (like
LEDs). If you are trying to use something that plugs into one of the output
ports, then you are in the right place. If you are working with a motor that
connects to a motor controller which plugs into an input port, you will find
information on the motor controller on the [sensors] page.

This page lists well-known devices, however any device that is rated for 9VDC,
requires 500mA or less and can handle pulse width modulation is safe to connect
directly to the output ports on the EV3.

## Types of Motors (and Other Output Devices)

There are currently three basic types of classes of devices that are supported
in ev3dev. Tacho motors, DC motors and LEDs.

### Tacho Motors

Tacho motors get their name from the LMS2012 (official LEGO) source code. Tacho
is short for [tachometer]. This is probably a bit of a misnomer because the
motor itself does not have a tachometer. Instead, the EV3 brick acts as the
tachometer. Technically speaking the motors have a [incremental rotary encoder]
(also called quadrature encoder) that is used by the EV3 to determine the speed
and direction of rotation.

### DC Motors

DC motors are just "plain" motors. They do *not* have a quadrature encoder for
feedback.

### LEDs

Any 9VDC rated (i.e. it has an appropriately sized resistor) LED can be used.

## Using Motors and LEDs

Currently, only NXT and EV3 motors can be automatically detected. To use other
devices, see the [EV3 Output Port Driver] for information on how to set the
mode of the output port.

RCX compatible (aka 9V) motors and LEDs can be connected to the EV3 using a
[LEGO 8528] cable.

Power Functions motors and LEDs can be connected using a [LEGO 8528] cable plus
a [LEGO 8886] cable or [LEGO 8871] cable.

## Supported Devices

This is a list of devices that currently have drivers available in the ev3dev
kernel.

### Motors

<table class="table table-striped table-bordered table-indexed">
    <thead>
    <tr>
    <th>Manufacturer</th>
    <th>P/N</th>
    <th>Name</th>
    <th>Auto-<br />detected</th>
    <th>Driver (Module)</th>
    </tr>
    </thead>
    <tbody>
{% assign prev_vendor_name = 'dummy' %}
{% for motor_data in site.data.motors %}
    {% assign device = motor_data %}
    <tr>
    {% if device.vendor_name != prev_vendor_name %}
        {% assign vendor_name_rowspan = 0 %}
        {% for sensor_data2 in site.data.motors %}
            {% assign device2 = sensor_data2 %}
            {% if device2.vendor_name == device.vendor_name %}
                {% assign vendor_name_rowspan = vendor_name_rowspan | plus: 1 %}
            {% endif %}
        {% endfor %}
        <th rowspan="{{ vendor_name_rowspan }}">{{ device.vendor_name }}</th>
    {% endif %}
        <td>{{ device.vendor_part_number }}</td>
        <td><a href="{{ device.url_name }}">{{ device.vendor_part_name }}</a></td>
        <td>
            {% if device.motor_type == "ev3" %}
            <span style="white-space:nowrap;" markdown="1">{% if device.vendor_name == "LEGO" %}Y{% else %}N{% endif %}[^autodetect]</span>
            {% else %}
            N
            {% endif %}
        </td>
        <td>
            <span style="white-space:nowrap;">{{ device.name }}</span>
            <span style="white-space:nowrap;">({{ device.motor_type }}-motor)</span>
        </td>
    </tr>
    {% assign prev_vendor_name = device.vendor_name %}
{% endfor %}
    </tbody>
</table>

### LEDs

TODO: We need a list of LEGO MINDSTORMS compatible LED devices. Want to help make
a list? See issue [#424](https://github.com/ev3dev/ev3dev/issues/424).

[^autodetect]: Motors are only automatically detected on the LEGO MINDSTORMS EV3
    platform. LEGO NXT Motors are detected as LEGO EV3 Large motors. 3rd party
    motors will not be correctly detected and must be manually specified.

[sensors]: /docs/sensors
[tachometer]: https://en.wikipedia.org/wiki/Tachometer
[incremental rotary encoder]: https://en.wikipedia.org/wiki/Rotary_encoder#Incremental_rotary_encoder
[LEGO 8528]: http://shop.lego.com/en-US/Converter-Cables-for-LEGO-MINDSTORMS-NXT-8528
[LEGO 8886]: http://shop.lego.com/en-US/LEGO-Power-Functions-Extension-Wire-8886
[LEGO 8871]: http://shop.lego.com/en-US/LEGO-Power-Functions-Extension-Wire-20-8871
[EV3 Output Port Driver]: /docs/ports/legoev3-output-port
