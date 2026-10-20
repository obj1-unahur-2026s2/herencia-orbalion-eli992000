class Equipos{
    const property nombre
    const property tecComplementaria = [] 
    var property nivelDeEnergiaBase = 0 
    var property entrenador 
    var energia = 0

    method tecnologiasActivas() = tecComplementaria.filter({t => t.activa()})
    method energiaTotal() = energia
    method sumarEnergiaTotal() {energia = nivelDeEnergiaBase + self.tecnologiasActivas().sum({t => t.valorEnergetico()})}
    method esDePrestigioUniversal(){}
}

class Luminico inherits Equipos{
    var nivelDeRadiacionCapturada = 0
    const property cristalesSolares = ["zafiro","oxidiana", "mithril" ]
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
    override method esDePrestigioUniversal() = self.cristalesSolares().size() >= 3 && self.entrenador().esEliteGalactico() && self.tecComplementaria().any({t=>t.activa()})
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
    override method esDePrestigioUniversal() = self.estaCertificado() && self.cantModulosActivos() > 3 && self.tecComplementaria().all({t=>t.activa()})
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
    method esEliteGalactico() = cantDeCiclosLunares > 10 and self.rol().cumple(self)
}
class Rol {
    var property estaHomologado = true

    method cumple(entrenador){}
}
object estrategaCuantico inherits Rol{
   
   override method cumple(entrenador) = entrenador.nivelDePresicionEstrategica() > 80
}
object arquitectoDeEnergia inherits Rol{
    
    override method cumple(entrenador) = entrenador.estaEnSintonia()
}
object guiaMental inherits Rol{
    
    override method cumple(entrenador) = true
}
//Ejemplos de tecnologías: núcleos gravitacionales, interfaces de proyección mental, cámaras de fusión energética.
class TecnologiasComplementarias{
    var property nombre = ""
    var property valorEnergetico = 0
    var property activa = false

    method desactivada() {activa = false}
    method activada() {activa = true}
}
