# Postfix exporter formula

Installs Debian/Ubuntu's `prometheus-postfix-exporter` package, manages its daemon arguments, grants the package-created `prometheus` user read access to the mail log through the existing `adm` group, and enables the packaged service.

This replaces the former embedded, unaudited 2021 binary and custom unit. Bind to loopback unless a firewall or trusted monitoring network protects the metrics endpoint. See `pillar.example`.

## Relationship to upstream

**This formula was written from scratch for one specific deployment. It is
not a fork of anything, and there is no upstream to fall back to.**

There is no formula of this name in the
[saltstack-formulas](https://github.com/saltstack-formulas) project. What it borrows from that project is
convention, not code: the `map.jinja` + `defaults.yaml` pattern, pillar as
the single override surface, and the general layout. Anything that did come
from elsewhere is noted in the file headers.

Its states, pillar keys, and defaults are shaped around the deployment it
was built for. Read `pillar.example` before pointing it at anything you
care about — it has had far less exposure than a widely-used formula, so
expect rough edges on platforms other than the ones it was written against.

### Credit

The structure and conventions come from the
[saltstack-formulas](https://github.com/saltstack-formulas) project; credit for that groundwork belongs to
its authors and contributors.

## License

Dedicated to the public domain under [CC0 1.0 Universal](LICENSE).
