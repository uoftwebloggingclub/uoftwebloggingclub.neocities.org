---
layout: default
title: Writing Events
---

# Writing Events

{% assign current_ts = "now" | date: "+%s" | plus: 0 %}
{% assign sorted_events = site.events | where_exp: "event", "event.name != 'index.md'" | sort: "end_timestamp" | reverse %}

## Active Events

{% for event in sorted_events %}
    {% assign event_ts = event.end_timestamp | plus: 0 %}
    {% if event_ts > current_ts %}
### [{{ event.title }}]({{ event.url }})
    {% endif %}
{% endfor %}

## Past Events

{% for event in sorted_events %}
    {% assign event_ts = event.end_timestamp | plus: 0 %}
    {% if event_ts <= current_ts %}
### [{{ event.title }}]({{ event.url }})
    {% endif %}
{% endfor %}