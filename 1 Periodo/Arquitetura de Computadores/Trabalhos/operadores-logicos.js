/* function checaNao() {
    bitDois = document.getElementById('bitDois')
    operacao = document.getElementById('operacao').value

    bitDois.disabled = false

    if (operacao == "NAO") {
        bitDois.disabled = true
    }
}

function calcularBit(){
    bitUm = document.getElementById('bitUm').value
    bitDois = document.getElementById('bitDois').value
    operacao = document.getElementById('operacao').value
    bitResultado = document.getElementById('bitResultado')

    if(operacao == "E"){
        e(bitUm, bitDois, bitResultado)
    } else if (operacao == "OU"){
        ou(bitUm, bitDois, bitResultado)
    } else if (operacao == "XOU"){
        xou(bitUm, bitDois, bitResultado)
    } else if (operacao == "NAO"){
        nao(bitUm, bitResultado)
    } else if (operacao == "NAOE"){
        naoe(bitUm, bitDois, bitResultado)
    } else if (operacao == "NAOOU"){
        naoou(bitUm, bitDois, bitResultado)
    }
} */

function e(bitUm, bitDois){
    if( (bitUm == 1) && (bitDois == 1) ){
        return 1
    } else {
        return 0
    }
}

function ou(bitUm, bitDois){
    if( (bitUm == 1) || (bitDois == 1) ){
        return 1
    } else {
        return 0
    }
}

function xou(bitUm, bitDois) {
    if( (bitUm == 1) && (bitDois == 1) ){
        return 0
    } else if( (bitUm == 0) && (bitDois == 0) ){
        return 0
    } else {
        return 1
    }
}
 
function nao(bitUm) {
    if(bitUm == 1){
        return 0
    } else {
        return 1
    }
}

function naoe(bitUm, bitDois) {
    if( (bitUm == 1) && (bitDois == 1) ){
        return 0
    } else {
        return 1
    }
}

function naoou(bitUm, bitDois) {
    if( (bitUm == 0) && (bitDois == 0) ){
        return 1
    } else {
        return 0
    }
}