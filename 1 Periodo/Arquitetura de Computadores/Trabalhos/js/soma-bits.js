function calcularSomaBin() {
    let bitUm = document.getElementById('binUm').value
    let bitDois = document.getElementById('binDois').value
    let resultadoBinUmDecInput = document.getElementById('resultadoBinUmDec')
    let resultadoBinDoisDecInput = document.getElementById('resultadoBinDoisDec')
    let resultadoSomaDecInput = document.getElementById('resultadoSomaDec')
    let resultadoSomaBinInput = document.getElementById('resultadoSomaBin')
    let resultado = []
    let resultadoString = ''

    bitUm = bitUm.split("")
    bitDois = bitDois.split("")

    let bitUmDecimal   = binarioParaDecimal(bitUm)
    let bitDoisDecimal = binarioParaDecimal(bitDois)

    bitUm = bitUm.reverse()
    bitDois = bitDois.reverse()

    let carryIn = 0

    let resPasso = []

    for (let index = 0; index < 4; index++) {
        resPasso = SomadorQuatroBits(bitUm[index], bitDois[index], carryIn)
        resultado.push(resPasso[0])
        carryIn = resPasso[1]
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
}

function SomadorQuatroBits(bitUm, bitDois, carryIn) {
    let res = []

    let s1 = e(bitUm, bitDois)
    let s2 = xou(bitUm, bitDois)

    res[0] = xou(s2, carryIn) 
    s2 = e(s2, carryIn)
    res[1] = ou(s1, s2)

    return res
}
