var url = "/geoserver/wms/GetMap",
    xml = document.getElementById("ta-sld").value,
    img = document.getElementById("img-preview")

fetch(url, {
  method: "POST", 
  //mode: "cors", // no-cors, cors, *same-origin
  cache: "no-cache",
  //credentials: "same-origin", // include, *same-origin, omit
  headers: {
    "Content-Type"  : "text/xml",
    "Content-length": xml.length,
    "Connection"    : "close"
            // "Content-Type": "application/x-www-form-urlencoded",
  },
  redirect: "follow",
  referrer: "no-referrer",
  body: xml
})
.then((resp) => {
  if(resp.headers.get('Content-Type').indexOf('vnd.ogc.se_xml') > -1) {
    resp.text().then(console.log)
    return
  }
  return resp.blob()
})
.then(myBlob => {
  var blobUrl = URL.createObjectURL(myBlob)
  console.log(img)
  img.src = blobUrl
})
