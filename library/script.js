const addNewBook = document.querySelector("#addNewBook");
const newBookForm = document.querySelector("#newBookForm");
const submit = document.querySelector("#submit");
const addNewBookForm = document.querySelector("#addNewBookForm");
const bookList = document.querySelector(".book-list");
let sampleBook = new Book("ZeroZeroZero", "Roberto Saviano", 600, true);
let sampleBook2 = new Book("Zero", "Roberto Saviano", 600, false);
let lordOfTheRings = new Book(
  "Lord of the rings",
  "J R R Tolkien",
  2300,
  false
);
let myLibrary = [sampleBook, lordOfTheRings, sampleBook2];

function deleteBook(event) {
  bookId = event.target.dataset.book_id;
  myLibrary.splice(bookId, 1);
  console.log(myLibrary);
  render();
}

function createSwitch(id, readStatus) {
  let switchBtn = document.createElement("div");
  let checkbox = document.createElement("input");
  let label = document.createElement("label");
  checkbox.type = "checkbox";
  checkbox.checked = readStatus;
  checkbox.className = "custom-control-input";
  checkbox.id = `switch-${id}`;
  checkbox.dataset.book_id = id;
  label.htmlFor = `switch-${id}`;
  label.className = "custom-control-label";
  label.innerHTML = "Mark as read";
  switchBtn.classList.add("custom-control", "custom-switch");
  switchBtn.appendChild(checkbox);
  switchBtn.appendChild(label);
  switchBtn.addEventListener("change", changeReadStatus);
  return switchBtn;
}

function changeReadStatus(event) {
  bookId = event.target.dataset.book_id;
  console.log("changed");
  newReadStatus = event.target.checked;
  myLibrary[bookId].read = newReadStatus;
}

function createCard(book, index) {
  let li = document.createElement("li");
  let card = document.createElement("div");
  card.className = "card";
  let header = document.createElement("h5");
  header.classList.add("card-header");
  let cardBody = document.createElement("div");
  cardBody.className = "card-body";
  let cardTitle = document.createElement("h6");
  cardTitle.className = "card-title";
  let paragraph = document.createElement("p");
  paragraph.classList.add("card-text", "text-muted");

  bookList.appendChild(li);
  li.appendChild(card);
  card.appendChild(header);
  header.innerHTML = book.title;

  card.appendChild(cardBody);
  cardBody.appendChild(cardTitle);
  cardTitle.innerHTML = book.author;

  cardBody.appendChild(paragraph);
  paragraph.innerHTML = `No. of pages : ${book.pages}`;

  let switchBtn = createSwitch(index, book.read);
  cardBody.appendChild(switchBtn);

  let deleteBtn = createDeleteBtn(index);
  cardBody.appendChild(deleteBtn);

  return card;
}

function createDeleteBtn(index) {
  let deleteBtn = document.createElement("button");
  deleteBtn.classList.add("btn", "btn-danger", "btn-sm");
  deleteBtn.innerHTML = "Delete";
  deleteBtn.dataset.book_id = index;
  deleteBtn.addEventListener("click", deleteBook);
  return deleteBtn;
}

function render() {
  bookList.innerHTML = "";
  for (let i = 0; i < myLibrary.length; i++) {
    createCard(myLibrary[i], i);
  }
}

addNewBook.addEventListener("click", () => {
  newBookForm.style.display = "block";
});

function Book(title, author, pages, read) {
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.read = read;
}

function addBookToLibrary(book) {
  myLibrary.push(book);
}

function clearForm() {
  document.querySelector("#title").value = "";
  document.querySelector("#author").value = "";
  document.querySelector("#pages").value = "";
  document.querySelector("#read").checked = false;
}

addNewBookForm.addEventListener("submit", (event) => {
  event.preventDefault();
  let title = document.querySelector("#title").value;
  let author = document.querySelector("#author").value;
  let pages = document.querySelector("#pages").value;
  let read = document.querySelector("#read").checked;

  let book = new Book(title, author, pages, read);
  addBookToLibrary(book);
  newBookForm.style.display = "none";
  clearForm();
  render();
});

window.addEventListener("load", () => {
  render();
});
