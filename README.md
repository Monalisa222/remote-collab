# README
# RemoteCollab

RemoteCollab is a modern SaaS-style collaborative proposal and project management platform built with:

- Rails 8.1.2
- PostgreSQL
- Turbo + Stimulus
- Kamal (container deployment)

## Architecture Goals

- Organization-based access
- Role-based authorization
- Proposal collaboration
- Background jobs
- JSON API
- Service object pattern

## Local Setup

```bash
bundle install
rails db:create
rails s
