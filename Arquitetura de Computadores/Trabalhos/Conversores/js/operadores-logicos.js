function calcularBit(){
    bitUm = document.getElementById('bitUm').value
    bitDois = document.getElementById('bitDois').value
    operacao = document.getElementById('operacao').value
    bitResultado = document.getElementById('bitResultado')

    if(operacao == "E"){
        bitResultado.value = e(bitUm, bitDois)
    } else if (operacao == "OU"){
        bitResultado.value = ou(bitUm, bitDois)
    } else if (operacao == "XOU"){
        bitResultado.value = xou(bitUm, bitDois)
    } else if (operacao == "NAO"){
        bitResultado.value = nao(bitUm)
    } else if (operacao == "NAOE"){
        bitResultado.value = naoe(bitUm, bitDois)
    } else if (operacao == "NAOOU"){
        bitResultado.value = naoou(bitUm, bitDois)
    }
}

function checaNao() {
    bitDois = document.getElementById('bitDois')
    operacao = document.getElementById('operacao').value

    bitDois.disabled = false

    if (operacao == "NAO") {
        bitDois.disabled = true
    }
}

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