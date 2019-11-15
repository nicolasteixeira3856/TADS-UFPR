function calcularSomaBin() {
    let bitUm = document.getElementById('binUm').value
    let bitDois = document.getElementById('binDois').value
    let carryIn = 0
    let resultadoSoma = []
    let resultadoBinUmDecInput = document.getElementById('resultadoBinUmDec')
    let resultadoBinDoisDecInput = document.getElementById('resultadoBinDoisDec')
    let resultadoSomaDecInput = document.getElementById('resultadoSomaDec')
    let resultadoSomaBinInput = document.getElementById('resultadoSomaBin')
    let resultado = []
    let resultadoString = ''
    let crocodile = document.getElementById('crocodile')

    bitUm = bitUm.split("")
    bitDois = bitDois.split("")

    let bitUmDecimal   = binarioParaDecimal(bitUm)
    let bitDoisDecimal = binarioParaDecimal(bitDois)

    bitUm = bitUm.reverse()
    bitDois = bitDois.reverse()

    for (let index = 0; index < 4; index++) {
        resultadoSoma = SomadorQuatroBits(bitUm[index], bitDois[index], carryIn)
        resultado.push(resultadoSoma[0])
        carryIn = resultadoSoma[1]
    }
    
    if (carryIn == 1) {
        resultado.push(carryIn)
    }
    
    resultado = resultado.reverse()
    
    if(resultado[0] == 0){
        resultado.splice([0], 1)
    }

    for (let index = 0; index < resultado.length; index++) {
        resultadoString += resultado[index]
    }

    resultadoBinUmDecInput.value   = bitUmDecimal
    resultadoBinDoisDecInput.value = bitDoisDecimal
    resultadoSomaDecInput.value    = bitUmDecimal + bitDoisDecimal
    resultadoSomaBinInput.value    = resultadoString

    switch (resultadoString) {
        case "10101":
                crocodile.innerHTML = '<a href="crocodile/0.png" target="_blank"><img class="img-fluid" src="crocodile/0.png"></a>'
            break;
    
        case "1100":
                crocodile.innerHTML = '<a href="crocodile/1.png" target="_blank"><img class="img-fluid" src="crocodile/1.png"></a>'
            break;
    
        case "11010":
                crocodile.innerHTML = '<a href="crocodile/2.png" target="_blank"><img class="img-fluid" src="crocodile/2.png"></a>'
            break;
    
        case "1111":
                crocodile.innerHTML = '<a href="crocodile/3.png" target="_blank"><img class="img-fluid" src="crocodile/3.png"></a>'
            break;
    
        case "10101":
                crocodile.innerHTML = '<a href="crocodile/4.png" target="_blank"><img class="img-fluid" src="crocodile/4.png"></a>'
            break;
    
        case "10000":
                crocodile.innerHTML = '<a href="crocodile/5.png" target="_blank"><img class="img-fluid" src="crocodile/5.png"></a>'
            break;
    
        case "11010":
                crocodile.innerHTML = '<a href="crocodile/6.png" target="_blank"><img class="img-fluid" src="crocodile/6.png"></a>'
            break;
    
        case "10011":
                crocodile.innerHTML = '<a href="crocodile/7.png" target="_blank"><img class="img-fluid" src="crocodile/7.png"></a>'
            break;
    
        case "101":
                crocodile.innerHTML = '<a href="crocodile/8.png" target="_blank"><img class="img-fluid" src="crocodile/8.png"></a>'
            break;
    
        case "100":
                crocodile.innerHTML = '<a href="crocodile/9.png" target="_blank"><img class="img-fluid" src="crocodile/9.png"></a>'
            break;
    
        case "1010":
                crocodile.innerHTML = '<a href="crocodile/10.png" target="_blank"><img class="img-fluid" src="crocodile/10.png"></a>'
            break;
    
        case "111":
                crocodile.innerHTML = '<a href="crocodile/11.png" target="_blank"><img class="img-fluid" src="crocodile/11.png"></a>'
            break;
    
        case "101":
                crocodile.innerHTML = '<a href="crocodile/12.png" target="_blank"><img class="img-fluid" src="crocodile/12.png"></a>'
            break;
    
        case "1000":
                crocodile.innerHTML = '<a href="crocodile/13.png" target="_blank"><img class="img-fluid" src="crocodile/13.png"></a>'
            break;
    
        case "1010":
                crocodile.innerHTML = '<a href="crocodile/14.png" target="_blank"><img class="img-fluid" src="crocodile/14.png"></a>'
            break;

        case "1011":
                crocodile.innerHTML = '<a href="crocodile/15.png" target="_blank"><img class="img-fluid" src="crocodile/15.png"></a>'
            break;
    
        default:
                crocodile.innerHTML = ''
            break;
    }
}

function SomadorQuatroBits(bitUm, bitDois, carryIn) {
    let respostaSomador = []

    let somaUm = xou(bitUm, bitDois)
    let somaDois = e(bitUm, bitDois)

    respostaSomador[0] = xou(somaUm, carryIn) 
    somaUm = e(somaUm, carryIn)
    respostaSomador[1] = ou(somaUm, somaDois) //CarryOut

    return respostaSomador
}
