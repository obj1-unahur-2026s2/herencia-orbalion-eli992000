class Equipos{
    const property nombre
    const property tecComplementaria = [] 
    var property nivelDeEnergiaBase 
    var property entrenador 
    var energia = 0
    const property tecnologiasActivas = []

    method agregarTecnologiaActiva(tecnologia){if (tecnologia.activa()) tecnologiasActivas.add(tecnologia)}
    method energiaTotal() = energia
    method sumarEnergiaTotal() {energia = nivelDeEnergiaBase + tecnologiasActivas.sum({t => t.valorEnergetico()})}
    
}

class Luminico inherits Equipos{
    var nivelDeRadiacionCapturada = 0
    const  cristalesSolares = ["zafiro","oxidiana", "mithril" ]
    var cristalAmplificador = "oxidiana"
 
    method agregarCristalSolar(nuevoCristal){ cristalesSolares.add(nuevoCristal)}
    method elegirUnCristal(unCristal) = cristalesSolares.find(unCristal)
    method cambiarCristalAmplificador(unCristal){ cristalAmplificador = self.elegirUnCristal(unCristal)}
    method cristalAmplificador() = cristalAmplificador
    method cambiarNivelDeRadiacion(valorCapturado){ nivelDeRadiacionCapturada = valorCapturado }
    method nivelDeRadiacion() = nivelDeRadiacionCapturada
    method sumarSitieneMenosRadiacionDe5000() = if  ( self.nivelDeRadiacion() <= 5000) self.energiaTotal() * 0.10 else 0 
    override method sumarEnergiaTotal() {super()
    energia += self.sumarSitieneMenosRadiacionDe5000()}
}
class Sintetico inherits Equipos{
    var nivelDeProcesamientoCentral = 0
    var estaCertificado = false
    var cantModulosActivos = 0

    method certificarUnidadEstable(){ estaCertificado = true}
    method estaCertificado() = estaCertificado
    method cambiarNivelDeProcesamiento(nivel){ nivelDeProcesamientoCentral = nivel * 10**12}
    method nivelDeProcesamientoCentral() = nivelDeProcesamientoCentral
    method cambiarModulosActivos(modulos){ cantModulosActivos = modulos}
    method cantModulosActivos() = cantModulosActivos
    method sumarSiTieneMenosde5() = if (self.cantModulosActivos() > 5) self.energiaTotal() * 0.20 else 0 
    override method sumarEnergiaTotal(){super() energia -= self.sumarSiTieneMenosde5()}
}
class Eterico inherits Equipos{
    var nivelDeFluctuacionDimensional = 0
    var cantPortalesEnergeticosAbiertos = 0

    method cambiarNivelDeFluctuacionDimensional(nivel){ nivelDeFluctuacionDimensional = nivel}
    method nivelDeFluctuacionDimensional() = nivelDeFluctuacionDimensional
    method cambiarCantidadDePortalesAbiertos(cantidad){ cantPortalesEnergeticosAbiertos = cantidad}
    method cantidadDePortalesAbiertos() = cantPortalesEnergeticosAbiertos
}
class Entrenador {
    var property cantDeCiclosLunares = 0
    var property estaEnSintonia = true
    var nivelDePresicionEstrategica = 0
    var rolHomologado = guiaMental
    
    method cambiarNivelDePresicion(nivel){ nivelDePresicionEstrategica = nivel}
    method nivelDePresicionEstrategica() = nivelDePresicionEstrategica
    method cambiarRol(unRol){if (unRol.estaHomologado()) rolHomologado = unRol else self.error("Rol no homologado por la FOZ") }
    method rol() = rolHomologado
    // method cumple(entrenador) = rol().cumple(entrenador)
    method esEliteGalactico(unRol) = cantDeCiclosLunares > 10 and unRol.cumple(self)
}
//Cumple según su rol:
//Estratega Cuántico: precisión > 80.
//Arquitecto de Energía: debe estar en sintonía con el equipo.
//Guía Mental: no tiene condiciones adicionales.
class Rol {
    var property estaHomologado = true
    

}
object estrategaCuantico{
    method cumple(entrenador) = entrenador.nivelDePresicionEstrategica() > 80
}
object arquitectoDeEnergia{
    method cumple(entrenador) = entrenador.estaEnSintonia()
}
object guiaMental{
    method cumple(entrenador) = entrenador.cantDeCiclosLunares() >= 15
}
//Ejemplos de tecnologías: núcleos gravitacionales, interfaces de proyección mental, cámaras de fusión energética.
class TecnologiasComplementarias{
    var property nombre = ""
    var property valorEnergetico = 0
    var property activa = false

    method desactivada() {activa = false}
    method activada() {activa = true}
}
