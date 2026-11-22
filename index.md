---
layout: page
title: Dev log
---

I am Yeyeong Kwak, a Master of IT student in Adelaide. I previously worked as a full-stack web developer with React, TypeScript, and Spring. I am learning embedded software (ESP32, C, and hardware test automation) and studying for AWS Solutions Architect Associate.

Daily mission notes will be posted under [Daily Dev Coding]({{ '/daily-dev-coding/' | relative_url }}), grouped by subject:

<ul>
{% for subject in site.data.subjects %}
  <li><a href="{{ '/daily-dev-coding/' | append: subject.slug | append: '/' | relative_url }}">{{ subject.title | escape }}</a></li>
{% endfor %}
</ul>
