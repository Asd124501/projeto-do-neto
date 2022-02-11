document.addEventListener("DOMContentLoaded", function () {
    const dropdownTriggers = document.querySelectorAll(".dropdown-trigger");
    const dropdownTriggersInstances = M.Dropdown.init(dropdownTriggers, {
        coverTrigger: false,
    });

    const dropdownCoverTriggers = document.querySelectorAll(
        ".dropdown-trigger.cover-trigger"
    );
    const dropdownCoverTriggersInstances = M.Dropdown.init(
        dropdownCoverTriggers,
        {}
    );

    const drawers = document.querySelectorAll(".sidenav");
    const drawersInstances = M.Sidenav.init(drawers, { edge: "right" });

    var tooltips = document.querySelectorAll(".tooltipped");
    var tooltipsInstances = M.Tooltip.init(tooltips, {});

    var modals = document.querySelectorAll(".modal");
    var modalsInstances = M.Modal.init(modals, {});

    var selects = document.querySelectorAll("select");
    var selectsInstances = M.FormSelect.init(selects, {});

    const tableFormDialog = document.querySelector("#tableFormDialog");
    const dialogTitle = tableFormDialog.querySelector("h5");
    var tableFormDialogInstance = M.Modal.getInstance(tableFormDialog);

    const table = document.querySelector("table");

    table.addEventListener("click", (event) => {
        const cell = event.target;
        const row = cell.parentElement;

        const allRows = table.querySelectorAll("tr");
        Array.from(allRows).forEach((row) => {
            row.classList.remove("selected");
        });

        row.classList.add("selected");
    });

    table.addEventListener("dblclick", (event) => {
        const cell = event.target;
        const row = cell.parentElement;
        const rowCells = row.children;

        Array.from(rowCells).forEach((element) => {
            console.log(element.textContent);
        });

        dialogTitle.textContent = rowCells[0].textContent;

        tableFormDialogInstance.open();
    });
}); 