---
title: POEI DevOps - Grafana
author: David DEBRAY
date: 2021-08-13
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

---

#### Introduction

Formateur: **Alexandre Chaussier**

- Mail: <a.chaussier@infopen.pro>
- Tél: [06.63.73.54.92](06.63.73.54.92)

2e partie de 3 formations:

- Terraform
- Prometheus & **Grafana**
- ELK Stack 

---



# Documentations
## Site Officiel

- <https://grafana.com/grafana/>


## Online Docs

## Doc Source
<!-- <iframe src="2021-08-13-POEI-Grafana/"></iframe> -->


---

# Introduction
## Introduction
<iframe src="2021-08-13-POEI-Grafana/introduction.html"></iframe>

# Les Concepts
## Les Concepts basique
<iframe src="2021-08-13-POEI-Grafana/concepts.html"></iframe>

# L'interface Web
## Les écrans
<iframe src="2021-08-13-POEI-Grafana/ecrans.html"></iframe>




# Exemples de visualisation 

```json
{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": 21,
  "iteration": 1606687058783,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 10,
      "panels": [],
      "title": "Concepts",
      "type": "row"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                35
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Too many samples",
        "name": "Scrape max samples",
        "noDataState": "no_data",
        "notifications": [
          {
            "uid": "6GtnfdTGz"
          }
        ]
      },
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "-- Mixed --",
      "description": "",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 8,
        "x": 0,
        "y": 1
      },
      "hiddenSeries": false,
      "id": 6,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "datasource": "VictoriaMetrics",
          "expr": "scrape_samples_scraped < 100",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        },
        {
          "datasource": "-- Grafana --",
          "hide": false,
          "queryType": "randomWalk",
          "refId": "B"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "fill": true,
          "line": true,
          "op": "gt",
          "value": 35
        }
      ],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Datasource mixed",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "$datasource",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 8,
        "x": 8,
        "y": 1
      },
      "hiddenSeries": false,
      "id": 4,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scrape_samples_scraped{job=~\"$job\"}",
          "interval": "",
          "legendFormat": "{{job }} ( {{instance}} )",
          "queryType": "randomWalk",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Variables",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "-- Dashboard --",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 8,
        "x": 16,
        "y": 1
      },
      "hiddenSeries": false,
      "id": 8,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "panelId": 4,
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Dashboard datasource",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 10
      },
      "id": 14,
      "panels": [],
      "title": "Repeat Panel",
      "type": "row"
    },
    {
      "datasource": "VictoriaMetrics",
      "description": "",
      "fieldConfig": {
        "defaults": {
          "custom": {},
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 11
      },
      "id": 16,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "7.3.1",
      "repeat": "Job",
      "targets": [
        {
          "expr": "scrape_samples_scraped{job=~\"$job\"}",
          "interval": "",
          "legendFormat": "{{ instance }}",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Scraped values for $job",
      "type": "stat"
    },
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 14
      },
      "id": 28,
      "panels": [],
      "repeat": "job",
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "alertmanager",
          "value": "alertmanager"
        }
      },
      "title": "Reapeat Row - $job - Scrapped series",
      "type": "row"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {},
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 15
      },
      "id": 30,
      "options": {
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "7.3.1",
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "alertmanager",
          "value": "alertmanager"
        }
      },
      "targets": [
        {
          "expr": "sum(scrape_samples_scraped{job=~\"$job\"}) by (job)",
          "instant": true,
          "interval": "",
          "legendFormat": "{{ job }}",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Last scraped sample",
      "transparent": true,
      "type": "gauge"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 8,
        "y": 15
      },
      "hiddenSeries": false,
      "id": 32,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "alertmanager",
          "value": "alertmanager"
        }
      },
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scrape_samples_scraped{job=~\"$job\"}",
          "interval": "",
          "legendFormat": "{{ instance }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Scraped history",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 15
      },
      "hiddenSeries": false,
      "id": 34,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "alertmanager",
          "value": "alertmanager"
        }
      },
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(scrape_series_added{job=~\"$job\"}) by (job)",
          "interval": "",
          "legendFormat": "{{ job }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Series added",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 23
      },
      "id": 49,
      "panels": [],
      "repeatIteration": 1606687058783,
      "repeatPanelId": 28,
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "blackbox",
          "value": "blackbox"
        }
      },
      "title": "Reapeat Row - $job - Scrapped series",
      "type": "row"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {},
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 24
      },
      "id": 50,
      "options": {
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "7.3.1",
      "repeatIteration": 1606687058783,
      "repeatPanelId": 30,
      "repeatedByRow": true,
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "blackbox",
          "value": "blackbox"
        }
      },
      "targets": [
        {
          "expr": "sum(scrape_samples_scraped{job=~\"$job\"}) by (job)",
          "instant": true,
          "interval": "",
          "legendFormat": "{{ job }}",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Last scraped sample",
      "transparent": true,
      "type": "gauge"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 8,
        "y": 24
      },
      "hiddenSeries": false,
      "id": 51,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "repeatIteration": 1606687058783,
      "repeatPanelId": 32,
      "repeatedByRow": true,
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "blackbox",
          "value": "blackbox"
        }
      },
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scrape_samples_scraped{job=~\"$job\"}",
          "interval": "",
          "legendFormat": "{{ instance }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Scraped history",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 24
      },
      "hiddenSeries": false,
      "id": 52,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "repeatIteration": 1606687058783,
      "repeatPanelId": 34,
      "repeatedByRow": true,
      "scopedVars": {
        "job": {
          "selected": true,
          "text": "blackbox",
          "value": "blackbox"
        }
      },
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(scrape_series_added{job=~\"$job\"}) by (job)",
          "interval": "",
          "legendFormat": "{{ job }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Series added",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 32
      },
      "id": 12,
      "panels": [],
      "title": "Visualisations (not linked to Job)",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "decimals": 2,
      "fieldConfig": {
        "defaults": {
          "custom": {
            "align": null,
            "filterable": false
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 8,
        "x": 0,
        "y": 33
      },
      "hiddenSeries": false,
      "id": 2,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(histogram_quantile(\n  0.5,\n  sum by(le) (\n    rate(\n      flask_http_request_duration_seconds_bucket[5m]\n    )\n  )\n), \"quantile\", \"0.5\", \"\", \"\")",
          "interval": "",
          "legendFormat": "{{quantile}}",
          "refId": "B"
        },
        {
          "expr": "label_replace(histogram_quantile(\n  0.9,\n  sum by(le) (\n    rate(\n      flask_http_request_duration_seconds_bucket[5m]\n    )\n  )\n), \"quantile\", \"0.9\", \"\", \"\")",
          "interval": "",
          "legendFormat": "{{quantile}}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Graph",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 8,
        "x": 8,
        "y": 33
      },
      "hiddenSeries": false,
      "id": 18,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "Duration",
          "bars": false,
          "fill": 3,
          "lines": true,
          "linewidth": 4,
          "yaxis": 2,
          "zindex": 3
        },
        {
          "alias": "Requetes",
          "bars": true,
          "color": "rgb(46, 59, 77)",
          "lines": false,
          "stack": true
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(flask_http_request_duration_seconds_sum [5m]))",
          "interval": "",
          "legendFormat": "Duration",
          "refId": "A"
        },
        {
          "expr": "sum(rate(flask_http_request_duration_seconds_count [5m]))",
          "interval": "",
          "legendFormat": "Requetes",
          "refId": "B"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Series overrides",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "reqps",
          "label": "",
          "logBase": 1,
          "max": "3",
          "min": "0",
          "show": true
        },
        {
          "format": "s",
          "label": "",
          "logBase": 1,
          "max": "5",
          "min": "0",
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 9,
        "w": 8,
        "x": 16,
        "y": 33
      },
      "hiddenSeries": false,
      "id": 20,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "avg",
          "fill": 0,
          "linewidth": 2
        },
        {
          "alias": "min",
          "fillBelowTo": "avg",
          "lines": false
        },
        {
          "alias": "max",
          "fillBelowTo": "min",
          "lines": false
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "avg(rate(flask_http_request_duration_seconds_bucket{status=\"200\", method=\"GET\"}[5m]))",
          "interval": "",
          "legendFormat": "avg",
          "refId": "A"
        },
        {
          "expr": "min(rate(flask_http_request_duration_seconds_bucket{status=\"200\", method=\"GET\"}[5m]))",
          "interval": "",
          "legendFormat": "min",
          "refId": "B"
        },
        {
          "expr": "max(rate(flask_http_request_duration_seconds_bucket{status=\"200\", method=\"GET\"}[5m]))",
          "interval": "",
          "legendFormat": "max",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Brouillard",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "cards": {
        "cardPadding": null,
        "cardRound": null
      },
      "color": {
        "cardColor": "#b4ff00",
        "colorScale": "sqrt",
        "colorScheme": "interpolateOranges",
        "exponent": 0.5,
        "max": null,
        "min": null,
        "mode": "spectrum"
      },
      "dataFormat": "timeseries",
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 42
      },
      "heatmap": {},
      "hideZeroBuckets": false,
      "highlightCards": true,
      "id": 22,
      "legend": {
        "show": true
      },
      "pluginVersion": "7.3.1",
      "reverseYBuckets": false,
      "targets": [
        {
          "expr": "rate(flask_http_request_duration_seconds_bucket[1m])",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Histogramme",
      "tooltip": {
        "show": true,
        "showHistogram": false
      },
      "tooltipDecimals": null,
      "type": "heatmap",
      "xAxis": {
        "show": true
      },
      "xBucketNumber": 20,
      "xBucketSize": "",
      "yAxis": {
        "decimals": null,
        "format": "short",
        "logBase": 1,
        "max": "0.6",
        "min": "0",
        "show": true,
        "splitFactor": null
      },
      "yBucketBound": "auto",
      "yBucketNumber": null,
      "yBucketSize": 0.03
    },
    {
      "datasource": "$datasource",
      "description": "",
      "fieldConfig": {
        "defaults": {
          "custom": {
            "align": null,
            "filterable": true
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 3700
              }
            ]
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "Values using gauges"
            },
            "properties": [
              {
                "id": "custom.displayMode",
                "value": "lcd-gauge"
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "Value"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 150
              },
              {
                "id": "custom.align",
                "value": "center"
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 8,
        "y": 42
      },
      "id": 24,
      "options": {
        "frameIndex": 1,
        "showHeader": true,
        "sortBy": [
          {
            "desc": true,
            "displayName": "Value"
          }
        ]
      },
      "pluginVersion": "7.3.1",
      "targets": [
        {
          "expr": "scrape_samples_scraped",
          "format": "table",
          "instant": true,
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Table with filters and transforms",
      "transformations": [
        {
          "id": "organize",
          "options": {
            "excludeByName": {
              "__name__": true
            },
            "indexByName": {
              "Time": 0,
              "Value": 4,
              "__name__": 1,
              "instance": 3,
              "job": 2
            },
            "renameByName": {}
          }
        },
        {
          "id": "calculateField",
          "options": {
            "alias": "Values using gauges",
            "mode": "reduceRow",
            "reduce": {
              "reducer": "sum"
            }
          }
        }
      ],
      "type": "table"
    },
    {
      "datasource": null,
      "description": "Samples scrapped",
      "fieldConfig": {
        "defaults": {
          "custom": {},
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 3700
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 42
      },
      "id": 26,
      "options": {
        "displayMode": "gradient",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "showUnfilled": true
      },
      "pluginVersion": "7.3.1",
      "targets": [
        {
          "expr": "sort(sum(scrape_samples_scraped) by (job))",
          "interval": "",
          "legendFormat": "{{ job }}",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bar gauge",
      "type": "bargauge"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "$datasource",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 10,
        "w": 8,
        "x": 0,
        "y": 50
      },
      "hiddenSeries": false,
      "id": 40,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "Receive",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_network_transmit_bytes_total [5m]))",
          "interval": "",
          "legendFormat": "Transmit",
          "refId": "A"
        },
        {
          "expr": "sum(rate(container_network_receive_bytes_total [5m]))",
          "interval": "",
          "legendFormat": "Receive",
          "refId": "B"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Negative Y viz",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                1.1
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "20s",
        "frequency": "10s",
        "handler": 1,
        "name": "Load 5 alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 10,
        "w": 4,
        "x": 8,
        "y": 50
      },
      "hiddenSeries": false,
      "id": 42,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "node_load5",
          "interval": "",
          "legendFormat": "{{ instance }}",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "fill": true,
          "line": true,
          "op": "gt",
          "value": 1.1
        }
      ],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Load 5",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                1.05
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "20s",
        "frequency": "10s",
        "handler": 1,
        "name": "Load 15 alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 10,
        "w": 4,
        "x": 12,
        "y": 50
      },
      "hiddenSeries": false,
      "id": 44,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.3.1",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "node_load15",
          "interval": "",
          "legendFormat": "{{ instance }}",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "fill": true,
          "line": true,
          "op": "gt",
          "value": 1.05
        }
      ],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Load 15",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "dashboardFilter": "",
      "dashboardTags": [],
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "folderId": null,
      "gridPos": {
        "h": 10,
        "w": 4,
        "x": 16,
        "y": 50
      },
      "id": 46,
      "limit": 10,
      "nameFilter": "",
      "onlyAlertsOnDashboard": false,
      "pluginVersion": "7.3.1",
      "show": "current",
      "sortOrder": 1,
      "stateFilter": [
        "no_data",
        "execution_error",
        "alerting",
        "pending"
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Current alerts",
      "type": "alertlist"
    },
    {
      "dashboardFilter": "",
      "dashboardTags": [],
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "folderId": null,
      "gridPos": {
        "h": 10,
        "w": 4,
        "x": 20,
        "y": 50
      },
      "id": 48,
      "limit": 10,
      "nameFilter": "",
      "onlyAlertsOnDashboard": false,
      "pluginVersion": "7.3.1",
      "show": "changes",
      "sortOrder": 1,
      "stateFilter": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Alerts changes",
      "type": "alertlist"
    }
  ],
  "refresh": "10s",
  "schemaVersion": 26,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {
          "selected": false,
          "text": "Prometheus",
          "value": "Prometheus"
        },
        "error": null,
        "hide": 0,
        "includeAll": false,
        "label": "Datasource",
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "prometheus",
        "queryValue": "",
        "refresh": 1,
        "regex": "/([PV].*)/",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "allValue": null,
        "current": {
          "selected": false,
          "text": "nodeexporter",
          "value": "nodeexporter"
        },
        "datasource": "$datasource",
        "definition": "label_values(up, job)",
        "error": null,
        "hide": 0,
        "includeAll": false,
        "label": "Job",
        "multi": true,
        "name": "job",
        "options": [
          {
            "selected": true,
            "text": "alertmanager",
            "value": "alertmanager"
          },
          {
            "selected": false,
            "text": "cadvisor",
            "value": "cadvisor"
          },
          {
            "selected": false,
            "text": "flask",
            "value": "flask"
          },
          {
            "selected": true,
            "text": "blackbox",
            "value": "blackbox"
          },
          {
            "selected": false,
            "text": "nodeexporter",
            "value": "nodeexporter"
          },
          {
            "selected": false,
            "text": "processes",
            "value": "processes"
          },
          {
            "selected": false,
            "text": "prometheus",
            "value": "prometheus"
          },
          {
            "selected": false,
            "text": "pushgateway",
            "value": "pushgateway"
          },
          {
            "selected": false,
            "text": "traefik",
            "value": "traefik"
          }
        ],
        "query": "label_values(up, job)",
        "refresh": 0,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Exemples visualisations",
  "uid": "XPU2_NoGk",
  "version": 26
}


```

---

# *Tips & Tricks*

## Documentations réseau

- <https://tls.ulfheim.net/>
- <https://www.frameip.com/>
