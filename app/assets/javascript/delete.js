deleteTeam = (id) =>
{
     Confirm.open({
     classblock:"main-page-team",
     message: "Are you sure?",
     title: "You are about to delete this team!",
     yes:"Delete",
     no: "Cansel",
      onok: () => {
            let form = document.createElement("form");
            form.method = "POST";
            form.action = `/users/teams/${id}`;
            form.style = "display: none;";
            let methodInput = document.createElement("input");
            methodInput.value = "DELETE";
            methodInput.name = "_method]";
            form.appendChild(methodInput);
            document.body.appendChild(form);
            form.submit();         
      }
     })
}

//Message for delete
var Confirm = {
    open (options) {
        options = Object.assign({}, {
            title: '',
            message: '',
            classblock: '',
            okText: 'OK',
            cancelText: 'Cancel',
            yes: '',
            no: '',
            onok: function () {console.log("delete")},
            oncancel: function () {console.log("cansel")}
        }, options);

    const html = `
         <div class="alert-warning">
                <img src = "/assets/teams/youWontDelete.svg"></img>
                <p class="warning-text"><span>${options.title}</span>${options.message}</p>
                <div class="warning-buttons">
                    <a style ='cursor: pointer;' id = warning-cansel>${options.no}</a>
                    <a style ='cursor: pointer;' id = warning-delete>${options.yes}</a>
                </div>
    `;

    const template = document.createElement('template')
    
    template.innerHTML = html;

    //Elements
    const confirmEl  = template.content.querySelector('.alert-warning');
    const bntNo      = template.content.querySelector('#warning-cansel');
    const bntYes     = template.content.querySelector('#warning-delete');


    confirmEl.addEventListener('click', e => {
            if (e.target === confirmEl) {
                options.oncancel();
                this._close(confirmEl,options.classblock);
            }
        });

        
    bntYes.addEventListener('click', () => {
            options.onok();
            this._close(confirmEl,options.classblock);
        });

    bntNo.addEventListener('click', () => {
                options.oncancel();
                this._close(confirmEl,options.classblock);
            });
    let main_page = document.body.getElementsByClassName(options.classblock)[0];
    
    main_page.appendChild(template.content);
  },

  _close(confirmEl,classname){
    confirmEl.classList.add('confirm--close');

        confirmEl.addEventListener('animationend', () => {

           
            let main_page = document.body.getElementsByClassName(classname)[0];
            
            main_page.removeChild(confirmEl);
        });
  }
}   


UnFollowTeam = (team_id) =>{
    Confirm.open({
        classblock: "cabinet-form",
        message: "Are you sure?",
        title: "You are in the way to unfollow this team!",
        yes:"Yes",
        no: "No",
        onok: () => {
              let form = document.createElement("form");
              form.method = "POST";
              form.action = `/users/cabinet/unfollow_team/${team_id}`;
              form.style = "display: none;";
              let methodInput = document.createElement("input");
              methodInput.value = "DELETE";
              methodInput.name = "_method]";
              form.appendChild(methodInput);
              document.body.appendChild(form);
              form.submit();         
        }
       })
}