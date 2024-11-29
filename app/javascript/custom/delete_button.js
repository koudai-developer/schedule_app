document.addEventListener("turbolinks:load", () => {
  // 削除ボタンを取得
  const indexDeleteButton = document.getElementById("index-delete-button");
  const modal = document.getElementById("delete-modal");
  const cancelButton = document.getElementById("cancel-delete-btn");
  const confirmDeleteButton = document.getElementById("confirm-delete-btn");

  let currentId = null;

  indexDeleteButton.addEventListener("click", function () {
    currentId = indexDeleteButton.getAttribute("data-id");
    modal.style.display = "flex";
  });

  cancelButton.addEventListener("click", function () {
    modal.style.display = "none";
  });

  modal.addEventListener("click", function (event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  });

  confirmDeleteButton.addEventListener("click", function () {
    if (currentId) {
      const form = document.createElement("form");
      form.method = "POST";
      form.action = `/schedules/${currentId}`;
      form.innerHTML = `
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="authenticity_token" value="${document.querySelector('meta[name="csrf-token"]').content}">
      `;
      document.body.appendChild(form);
      form.submit();
    }
  });
  
});
