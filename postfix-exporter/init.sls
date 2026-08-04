{% from "postfix-exporter/map.jinja" import config with context %}

{% if config.enabled %}
postfix-exporter-package:
  pkg.installed:
    - name: {{ config.package }}

postfix-exporter-log-access:
  group.present:
    - name: adm
    - addusers:
      - prometheus
    - require:
      - pkg: postfix-exporter-package

postfix-exporter-defaults:
  file.managed:
    - name: /etc/default/prometheus-postfix-exporter
    - user: root
    - group: root
    - mode: '0644'
    - contents: |
        # Managed by Salt.
        ARGS='--web.listen-address={{ config.listen_address }} {% for option in config.options %}{{ option }} {% endfor %}'
    - require:
      - pkg: postfix-exporter-package

postfix-exporter-service:
  service.running:
    - name: {{ config.service }}
    - enable: true
    - require:
      - group: postfix-exporter-log-access
    - watch:
      - file: postfix-exporter-defaults
{% else %}
postfix-exporter-service:
  service.dead:
    - name: {{ config.service }}
    - enable: false
{% endif %}
