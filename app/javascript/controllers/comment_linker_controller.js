import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["comments"]

  connect() {
    this.element.addEventListener("click", this.onClick.bind(this))
  }

  onClick(event) {
    // Handle clicking on a highlight -> scroll to comment
    const highlight = event.target.closest(".journal-highlight")
    if (highlight) {
      this.scrollToComment(highlight.dataset.commentId)
      return
    }

    // Handle clicking on a comment card -> scroll to highlight
    const commentCard = event.target.closest(".journal-comment-card")
    if (commentCard) {
      this.scrollToHighlight(commentCard.dataset.commentId)
    }
  }

  scrollToComment(id) {
    if (!id) return

    const commentCard = this.commentsTarget.querySelector(
      `[data-comment-id="${id}"]`
    )

    if (commentCard) {
      // Find the scrollable container
      const scrollContainer = commentCard.closest(".journal-edit__comments-list")
      if (scrollContainer) {
        const containerRect = scrollContainer.getBoundingClientRect()
        const cardRect = commentCard.getBoundingClientRect()
        const scrollTop = scrollContainer.scrollTop + (cardRect.top - containerRect.top) - (containerRect.height / 2) + (cardRect.height / 2)
        scrollContainer.scrollTo({ top: scrollTop, behavior: "smooth" })
      }

      commentCard.classList.add("journal-comment-card--active")
      setTimeout(() => commentCard.classList.remove("journal-comment-card--active"), 1500)
    }
  }

  scrollToHighlight(id) {
    if (!id) return

    const highlight = this.element.querySelector(
      `.journal-highlight[data-comment-id="${id}"]`
    )

    if (highlight) {
      // Find the scrollable transcript container
      const scrollContainer = highlight.closest(".journal-edit__transcript-section")
      if (scrollContainer) {
        const containerRect = scrollContainer.getBoundingClientRect()
        const highlightRect = highlight.getBoundingClientRect()
        const scrollTop = scrollContainer.scrollTop + (highlightRect.top - containerRect.top) - (containerRect.height / 2) + (highlightRect.height / 2)
        scrollContainer.scrollTo({ top: scrollTop, behavior: "smooth" })
      }

      // Add temporary highlight effect
      highlight.style.backgroundColor = "rgba(255, 179, 71, 0.8)"
      setTimeout(() => {
        highlight.style.backgroundColor = ""
      }, 1500)
    }
  }
}
