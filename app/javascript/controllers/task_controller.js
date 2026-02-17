import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
  toggle(event) {
    const taskId = event.target.dataset.taskId
    const proposalId = event.target.dataset.proposalId
    const organizationId = event.target.dataset.organizationId

    fetch(`/organizations/${organizationId}/proposals/${proposalId}/tasks/${taskId}`, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "text/vnd.turbo-stream.html"
      },
    })
  }
}
