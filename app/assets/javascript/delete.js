deleteTeam = (id) =>
{
     Confirm.open({
     
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
            okText: 'OK',
            cancelText: 'Cancel',
            onok: function () {console.log("delete")},
            oncancel: function () {console.log("cansel")}
        }, options);

    const html = `
         <div class="alert-warning">
                <img src = "/assets/teams/youWontDelete.svg"></img>
                <p class="warning-text"><span>You are about to delete this team!</span>Are you sure?</p>
                <div class="warning-buttons">
                    <a style ='cursor: pointer;' id = warning-cansel>Cancel</a>
                    <a style ='cursor: pointer;' id = warning-delete>Delete</a>
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
                this._close(confirmEl);
            }
        });

        
    bntYes.addEventListener('click', () => {
            options.onok();
            this._close(confirmEl);
        });

    bntNo.addEventListener('click', () => {
                options.oncancel();
                this._close(confirmEl);
            });
    let main_page = document.body.getElementsByClassName("main-page-team")[0];
    
    main_page.appendChild(template.content);
  },

  _close(confirmEl){
    confirmEl.classList.add('confirm--close');

        confirmEl.addEventListener('animationend', () => {

            let main_page = document.body.getElementsByClassName("main-page-team")[0];
            main_page.removeChild(confirmEl);
        });
  }
}   