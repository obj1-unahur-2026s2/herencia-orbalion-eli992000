class Linajes{
    const property nombre
    const property tecComplementaria = [] 
    var property nivelDeEnergiaBase 
    var property entrenador 
    var energia = 0
    const property tecnologiasActivas = []

    method agregarTecnologiaActiva(tecnologia){if (tecnologia.estadoActivo()) tecnologiasActivas.add(tecnologia)}
    method energiaTotal() = energia
    method sumarEnergiaTotal() { energia = nivelDeEnergiaBase + tecnologiasActivas.sum({t => t.valorEnergetico()})}
    
}

class Luminico inherits Linajes{
    var nivelDeRadiacionCapturada = 0
    const  cristalesSolares = ["oxidiana","piedra filosofal", "mytril" ]
    var cristalAmplificador = "oxidiana"
 
    method agregarCristalSolar(nuevoCristal){ cristalesSolares.add(nuevoCristal)}
    method elegirUnCristal(unCristal) = cristalesSolares.find(unCristal)
    method cambiarCristalAmplificador(unCristal){ cristalAmplificador = self.elegirUnCristal(unCristal)}
    method cristalAmplificador() = cristalAmplificador
    method cambiarNivelDeRadiacion(valorCapturado){ nivelDeRadiacionCapturada = valorCapturado }
    method nivelDeRadiacion() = nivelDeRadiacionCapturada
    method sumarSitieneMenosRadiacionDe5000() = if  ( self.nivelDeRadiacion() <= 5000) energia = energia + (self.energiaTotal() * 0.10) else energia + 0 
    override method sumarEnergiaTotal() {energia = nivelDeEnergiaBase  + self.sumarSitieneMenosRadiacionDe5000() }
}// tecnologiasActivas.sum({t => t.valorEnergetico()})
class Sintetico inherits Linajes{
    var nivelDeProcesamientoCentral = 0
    var estaCertificado = false
    var cantModulosActivos = 0

    method certificarUnidadEstable(){ estaCertificado = true}
    method estaCertificado() = estaCertificado
    method cambiarNivelDeProcesamiento(nivel){ nivelDeProcesamientoCentral = nivel * 10**12}
    method nivelDeProcesamientoCentral() = nivelDeProcesamientoCentral
    method cambiarModulosActivos(modulos){ cantModulosActivos = modulos}
    method cantModulosActivos() = cantModulosActivos
    //override method sumarEnergiaTotal(){super() if (self.cantModulosActivos() > 5) energiaTotal -= (self.energiaTotal() * 0.20)  }
}
class Eterico inherits Linajes{
    var nivelDeFluctuacionDimensional = 0
    var cantPortalesEnergeticosAbiertos = 0

    method cambiarNivelDeFluctuacionDimensional(nivel){ nivelDeFluctuacionDimensional = nivel}
    method nivelDeFluctuacionDimensional() = nivelDeFluctuacionDimensional
    method cambiarCantidadDePortalesAbiertos(cantidad){ cantPortalesEnergeticosAbiertos = cantidad}
    method cantidadDePortalesAbiertos() = cantPortalesEnergeticosAbiertos
}
class Entrenadores {
    var property cantDeCiclosLunares = 0
    var property estaEnSintonia = 0
    var nivelDePresicionEstrategica = 0
    var rolHomologado = guiaMental

    method cambiarNivelDePresicion(nivel){ nivelDePresicionEstrategica = nivel}
    method niveldeDePresicionEstrategica() = nivelDePresicionEstrategica.min(100)
    method cambiarRol(unRol){if (unRol.estaHomologado()) rolHomologado = unRol else self.error("Rol no homologado por la FOZ") }
    method rol() = rolHomologado
}
class Rol{
    var property estaHomologado = true
}
object estrategaCuantico inherits Rol{

}
object arquitectoDeEnergia inherits Rol{

}
object guiaMental inherits Rol{


}
object otroRol{
    var property estaHomologado = false
}
//Ejemplos de tecnologías: núcleos gravitacionales, interfaces de proyección mental, cámaras de fusión energética.
class TecnologiasComplementarias{
    var property nombre = ""
    var property valorEnergetico = 0
    var estado = true

    method cambiarEstado(){ estado = !estado}
    method estadoActivo() = estado

}
