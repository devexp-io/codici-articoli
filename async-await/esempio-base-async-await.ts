
console.log("1")
console.log("2")
console.log("3")
console.log("4")


console.log("1")
richiestaAsincrona( /*la callback*/function(){
  console.log("2")
  console.log("3")
})
console.log("4")


console.log("1")
richiestaAsincrona( /*la callback*/function(){
  console.log("2")
  console.log("3")
})
console.log("4")


async function esempioAsyncAwait(){
  console.log("1")
  await richiestaAsincrona2()
  console.log("2")
  console.log("3")
  console.log("4")
}



function richiestaAsincrona(x){}
async function richiestaAsincrona2(){
  return new Promise((res, rej) => {})
}

function funzioniAsincroneConCallbackClassica(){
  let callback = function() {
    console.log("ciao")
  }

  setTimeout(callback, 1000)
}


funzioniAsincroneConCallbackClassica()


async function funzioneConAsyncAwait(){
  await wait(1000)
  console.log("ciao")
}

async function wait(millis){
  const p = new Promise((res, rej)=>{
    setTimeout(()=>{
      res()
    }, millis)

  })
  return p
}

funzioneConAsyncAwait()
