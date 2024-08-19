const delbtn = document.getElementsByClassName("delbtn");
const wishdiv = document.getElementById("wishdiv");
const checkdiv = document.getElementById("checkdiv");
const chAll = document.getElementById("chAll")
const ch = document.getElementsByClassName("ch")
const delAll = document.getElementById("delAll")

let wishnum = 0;



checkdiv.addEventListener("click", (e)=>{
    let flag = false;

    for(check of ch){
        if(e.target.classList.contains("ch")){
            for(check of ch){
                if(check.checked){
                    flag=true;
                } else {
                    flag=false;
                    break
                }
            }
        }
    }

    chAll.checked = flag
})

chAll.addEventListener("click", ()=>{
    for(check of ch){
        check.checked = chAll.checked
    }
})

delAll.addEventListener("click", ()=>{
    for(check of ch){
        if(check.checked){
            wishnum = check.getAttribute("data-wnum")

            console.log(wishnum)
        }
    }
})

//각 아이템별 삭제 기능
checkdiv.addEventListener("click", (e)=>{

    
        let flag = false;
        for(del of delbtn){
            if(e.target.classList.contains("delbtn")){
                let check = confirm("장바구니에서 삭제하시겠습니까?")

                if(!check){
                    return
                }

                wishnum = e.target.getAttribute("data-wnum")
                flag = true;
                break
            } else if (e.target.classList.contains("far")){
                let check = confirm("장바구니에서 삭제하시겠습니까?")

                if(!check){
                    return
                }

                wishnum = e.target.closest('a').getAttribute("data-wnum")
                flag = true;
                break
            }
        }

        if(flag){
            fetch("deleteWishList?wishlist_num="+wishnum,{
                method:"get"
            }).then(r=>r.text())
            .then(r=>{
                r = r.trim()

                if(r>0){
                    
                    let delid = document.getElementById(wishnum)
        
                    delid.parentNode.parentNode.remove()
        
                }
        
            })
        
    }

    


})



