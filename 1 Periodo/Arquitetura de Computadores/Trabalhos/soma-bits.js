/*function calcularSomaBin() {
    let binUm = document.getElementById('binUm').value
    let binDois = document.getElementById('binDois').value
    let resultadoBinUmDec = document.getElementById('resultadoBinUmDec')
    let resultadoBinDoisDec = document.getElementById('resultadoBinDoisDec')
    let resultadoSomaDec = document.getElementById('resultadoSomaDec')
    let resultadoSomaBin = document.getElementById('resultadoSomaBin')
    let resultadoSomaBinAuxiliar = new Array
    let resultadoBinUm = new Array
    let resultadoBinDois = new Array
    let resultadoBinUmAuxiliar = 0
    let resultadoBinDoisAuxiliar = 0
    let binArrayUm = new Array()
    let binArrayDois = new Array()
    let binQtd = 0

    binArrayUm = binUm.split("")
    binQtd = binUm.length

    binQtd--

    for (let index = 0; index < binArrayUm.length; index++) {
        resultadoBinUm.push( (binArrayUm[index] * (Math.pow(2, binQtd))) )
        binQtd--
    }

    for (let index = 0; index < resultadoBinUm.length; index++) {
        resultadoBinUmAuxiliar += resultadoBinUm[index]
    }

    resultadoBinUmDec.value = resultadoBinUmAuxiliar

    binArrayDois = binDois.split("")
    binQtd = binDois.length

    binQtd--

    for (let index = 0; index < binArrayDois.length; index++) {
        resultadoBinDois.push( (binArrayDois[index] * (Math.pow(2, binQtd))) )
        binQtd--
    }

    for (let index = 0; index < resultadoBinDois.length; index++) {
        resultadoBinDoisAuxiliar += resultadoBinDois[index]
    }

    resultadoBinDoisDec.value = resultadoBinDoisAuxiliar
    resultadoSomaDec.value = resultadoBinUmAuxiliar + resultadoBinDoisAuxiliar

    let principal = (binArrayUm.length>binArrayDois.length || binArrayUm.length==binArrayDois.length) ? binUm : binDois;
    let secundario = (binArrayUm.length<binArrayDois.length) ? binUm : binDois;
    let resto = principal.split("");
    let subtraindo = secundario.split("");
    let levaBit = 0;
    let correcaoResultado = [];
    let arrayGenerica = [];

    for (var i = 0; i < resto.length; i++) {
        arrayGenerica.push(subtraindo[i]);
        if(arrayGenerica[i] === undefined){
            arrayGenerica.unshift('');
            arrayGenerica.pop();
        }
    }
    
    for (var i = resto.length - 1; i >= 0; i--) {
        if(resto[i] == levaBit){
            resto[i] = 0;
        } else {
            resto[i] = 1;
            levaBit = 0;
        }
        if(resto[i] != arrayGenerica[i]){
            correcaoResultado[i] = 1;
        } else if(resto[i] == arrayGenerica[i] && resto[i] != 1 && arrayGenerica[i] != 1){
            correcaoResultado[i] = 0;
        } else if(resto[i] == arrayGenerica[i] && resto[i] == 1 && arrayGenerica[i] == 1){
            levaBit = 1;
            correcaoResultado[i] = 0;
        }
        if(i == 0 && levaBit == 1){
            correcaoResultado.unshift(1);
        }
    };

    for(var a = 0; a < correcaoResultado.length; a++){
        resultadoSomaBinAuxiliar+=correcaoResultado[a];
    }

    resultadoSomaBin.value = resultadoSomaBinAuxiliar

    return true

  }*/


let bitUm = 1011
let bitDois = 1111
let resultado = []

bitUm = Array.from(bitUm.toString()).map(Number)
bitDois = Array.from(bitDois.toString()).map(Number)
bitUm = bitUm.reverse()   
bitDois = bitDois.reverse()   

let contador = 0
  
let carry = 0

for (let index = 0; index < bitUm.length; index++) {
    contador++

    
    if (contador >= 2) {
        let zero = xou(bitUm[index], bitDois[index])
        let um = e(bitUm[index], bitDois[index])
        resultado.push(xou(zero, carry))
        let tres = e(zero, 0)
        if (contador === 4) {
            resultado.push(ou(um, tres))
        }else {
            
            carry = (ou(um, tres))
            console.log(carry)
        }
    } else {
        let zero = xou(bitUm[index], bitDois[index])
        let um = e(bitUm[index], bitDois[index])
        resultado.push(xou(zero, 0))
        let tres = e(zero, 0)
        carry = (ou(um, tres))
        console.log(carry)
    }
}





console.log(resultado.reverse().join(""))