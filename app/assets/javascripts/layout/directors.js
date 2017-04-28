function openItem(evt, itemName) {
    // Declare all variables
    var i, tabcontent, tablinks, pHeading, pBody, pTitle, size, item, fill;
    // Get all elements with class="tabcontent" and hide them
    fill = document.getElementsByClassName("relleno")
    pBody = document.getElementsByClassName("panel-body");
    pHeading = document.getElementsByClassName("panel-heading");
    pTitle = document.getElementsByClassName("panel-title");
    tabcontent = document.getElementsByClassName("panel panel-default");

    fill[0].style.display = "none";

    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
        pBody[i].style.display = "none";
        pHeading[i].style.display = "none";
        pTitle[i].style.display = "none";
    }



    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab

   //size=idTesis.length;
    //alert(size);

    for(i = 0; i < 3; i++) {
        if(i===0){
            document.getElementById(itemName).style.display = "block";
            evt.currentTarget.className += " active";
        }else{
            item=itemName.concat(i.toString())
            document.getElementById(item).style.display = "block";
            evt.currentTarget.className += " active";
        }
    }

    //document.getElementById("defaultOpen").click();
}

function link_to_indexD(){
	
	location.href="/directors/index"
	// document.getElementsById(idGr).value = document.getElementsById(idG).value
}

document.getElementById("defaultOpen").click();