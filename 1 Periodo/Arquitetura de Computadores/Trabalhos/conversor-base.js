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
    let resultadoBinhexAuxiliar = new Array
    let resultadoBinhexAuxiliarDois = 0
    let binhexArray = new Array()
    let binhexQtd = 0

    if(basePai == 2){
        binhexArray = binhex.split("")
        binhexQtd = binhex.length

        binhexQtd--

        for (let index = 0; index < binhexArray.length; index++) {
            resultadoBinhexAuxiliar.push( (binhexArray[index] * (Math.pow(2, binhexQtd))) )
            binhexQtd--
        }

        for (let index = 0; index < resultadoBinhexAuxiliar.length; index++) {
            resultadoBinhexAuxiliarDois += resultadoBinhexAuxiliar[index]
        }

        return resultadoBinhex.value = resultadoBinhexAuxiliarDois

    } else if(basePai == 16) {
        binhex = binhex.toUpperCase()
        binhexArray = binhex.split("")
        binhexQtd = binhex.length

        binhexQtd--

        for (let index = 0; index < binhexArray.length; index++) {
            switch (binhexArray[index]) {
                case "A": { 
                    binhexArray[index] = 10 
                    break 
                }
                case "B": { 
                    binhexArray[index] = 11
                    break 
                }
                case "C": { 
                    binhexArray[index] = 12
                    break 
                }
                case "D": { 
                    binhexArray[index] = 13
                    break 
                }
                case "E": { 
                    binhexArray[index] = 14
                    break 
                }
                case "F": { 
                    binhexArray[index] = 15
                    break 
                }
                default: { 
                    binhexArray[index] = binhexArray[index]
                    break 
                }
            }
        }

        for (let index = 0; index < binhexArray.length; index++) {
            resultadoBinhexAuxiliar.push( (binhexArray[index] * (Math.pow(16, binhexQtd))) )
            binhexQtd--
        }

        for (let index = 0; index < resultadoBinhexAuxiliar.length; index++) {
            resultadoBinhexAuxiliarDois += resultadoBinhexAuxiliar[index]
        }

        return resultadoBinhex.value = resultadoBinhexAuxiliarDois
    }
  }