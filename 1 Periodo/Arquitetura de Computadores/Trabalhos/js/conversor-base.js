function converterBaseDecBinDecHex() {
    let decimal = document.getElementById('decimal').value
    let base = document.getElementById('base').value
    let digitoConversor = new Array()
    let loop = 0
    let resultado = document.getElementById('resultado')
    let resultadoAuxiliar = new Array()
    let resultadoAuxiliarDois = ''

    if (isNaN(decimal) || decimal.indexOf(".") > -1) {
        decimal = "";
        return false;
    }

    while (decimal != 0) {
      loop++;
      digitoConversor[loop] = decimal % base;
      decimal = Math.floor(decimal / base);
      resultadoAuxiliar.push(digitoConversor[loop])
    }

    for (let index = 0; index < resultadoAuxiliar.length; index++) {
        resultadoAuxiliarDois += resultadoAuxiliar[index]
    }

    if(base == 16){

        resultadoAuxiliarDois = ''

        while (loop >= 1) {

        switch (digitoConversor[loop]) {
            case 10: { 
                resultadoAuxiliarDois += "A" 
                break 
            }
            case 11: { 
                resultadoAuxiliarDois += "B" 
                break 
            }
            case 12: { 
                resultadoAuxiliarDois += "C" 
                break 
            }
            case 13: { 
                resultadoAuxiliarDois += "D" 
                break 
            }
            case 14: { 
                resultadoAuxiliarDois += "E"
                break 
            }
            case 15: { 
                resultadoAuxiliarDois += "F"
                break 
            }
            default: { 
                resultadoAuxiliarDois += digitoConversor[loop] 
                break 
            }
        }

        loop--;
        }
    }

    return resultado.value = resultadoAuxiliarDois.split("").reverse().join("")
}

function converterBaseBinDecHexDec() {
    let binhex = document.getElementById('binhex').value
    let basePai = document.getElementById('basePai').value
    let resultadoBinhex = document.getElementById('resultadoBinhex')
    let binhexArray = new Array()

    if(basePai == 2){
        binhexArray = binhex.split("")

        return resultadoBinhex.value = binarioParaDecimal(binhexArray)

    } else if(basePai == 16) {
        binhex      = binhex.toUpperCase()
        binhexArray = binhex.split("")

        return resultadoBinhex.value = hexadecimalParaDecimal(binhexArray)
    }
}

function binarioParaDecimal(bit){
    let resultadoConversao = []
    let resultadoConversaoSoma = 0
    let bitQtd = bit.length
    bitQtd--

    for (let index = 0; index < bit.length; index++) {
        resultadoConversao.push( (bit[index] * (Math.pow(2, bitQtd))) )
        bitQtd--
    }

    for (let index = 0; index < resultadoConversao.length; index++) {
        resultadoConversaoSoma += resultadoConversao[index]
    }

    return resultadoConversaoSoma
}

function hexadecimalParaDecimal(bit) {
    let resultadoConversao = []
    let resultadoConversaoSoma = 0

    let bitQtd = bit.length

    bitQtd--

    for (let index = 0; index < bit.length; index++) {
        switch (bit[index]) {
            case "A": { 
                bit[index] = 10 
                break 
            }
            case "B": { 
                bit[index] = 11
                break 
            }
            case "C": { 
                bit[index] = 12
                break 
            }
            case "D": { 
                bit[index] = 13
                break 
            }
            case "E": { 
                bit[index] = 14
                break 
            }
            case "F": { 
                bit[index] = 15
                break 
            }
            default: { 
                bit[index] = bit[index]
                break 
            }
        }
    }

    for (let index = 0; index < bit.length; index++) {
        resultadoConversao.push( (bit[index] * (Math.pow(16, bitQtd))) )
        bitQtd--
    }

    for (let index = 0; index < resultadoConversao.length; index++) {
        resultadoConversaoSoma += resultadoConversao[index]
    }


    return resultadoConversaoSoma
}
