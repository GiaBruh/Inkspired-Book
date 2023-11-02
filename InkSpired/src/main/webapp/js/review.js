function setRatingToDefault() {
    document.getElementById("r1").classList.add("fas");
    document.getElementById("r2").classList.add("fas");
    document.getElementById("r3").classList.add("fas");
    document.getElementById("r4").classList.add("fas");
    document.getElementById("r5").classList.add("fas");
}

function rating_Point(id) {
    setRatingToDefault();
    for (let i = id + 1; i <6; i++) {
        var rid = "r" + i;
        document.getElementById(rid).classList.remove("fas");
    }
}

function rating_Stable() {
    setRatingToDefault();
    var rate = parseInt(document.getElementById("rating").value) + 1;
    for (let i = rate; i < 6; i++) {
        var rid = "r" + i;
        document.getElementById(rid).classList.remove("fas");
    }
}

function rating_Click(id) {
    document.getElementById("rating").value = id;
    document.getElementById("comment").removeAttribute("hidden");
    document.getElementById("btnComment").removeAttribute("hidden");
    rating_Stable();
}

const d = new Date();
document.getElementById("review_date").value = d.toISOString().slice(0, 10);