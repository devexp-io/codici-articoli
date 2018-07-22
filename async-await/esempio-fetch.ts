
fetch("https://api.devexp.io/utenti")
  .then((response) => response.json())
  .then((response)=>console.log(response))
