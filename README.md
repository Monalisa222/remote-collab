# RemoteCollab

RemoteCollab is a multi-tenant collaboration platform built with Ruby on Rails.  
It allows organizations to manage proposals and tasks with role-based access control.

This project focuses on clean architecture, performance awareness, and production-ready practices rather than UI styling.

---

## 🚀 Features

- Multi-tenant organization system
- Membership-based access control
- Proposal creation with ownership tracking
- Task management within proposals
- Background job processing
- Turbo-powered updates
- Service object pattern for business logic
- Dockerized development setup
- RSpec test coverage

---

## 🏗 Architecture

- MVC architecture following Rails conventions
- Service Objects (e.g., `ProposalCreator`)
- Enum-based roles and task states
- Strict foreign key constraints
- Authentication enforced globally via `require_login`
- Clean separation between authentication and domain logic

---

## ⚡ Performance

- Eliminated N+1 queries using `includes`
- Indexed foreign keys
- Proper association usage
- Database-level constraints for data integrity

---

## 🧪 Testing

- RSpec test suite
- FactoryBot for test data
- Model and service-level testing

Run tests:

```bash
bundle exec rspec
