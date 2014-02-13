# Limpiando base de datos
Admin.destroy_all
Service.destroy_all
ServiceRequest.destroy_all
Status.destroy_all

# Crear tipos de servicio
open_status = Status.create(name: "Abierto", is_default: true)
verification_status = Status.create(name: "Verificación")
revision_status = Status.create(name: "Revisión")
close_status = Status.create(name: "Cerrado")

# Crear tipos de servicio
Service.create(name: "Toma tapada")
Service.create(name: "Ruptura de tuberia")
Service.create(name: "Fuga")
Service.create(name: "Desperdicio de agua")
Service.create(name: "Robo de alcantarilla")
Service.create(name: "Alcantarilla en mal estado")
Service.create(name: "Falla en el drenaje")
Service.create(name: "Solicitud de pipa de agua")
Service.create(name: "Reconexión de toma de agua potable")

# Crear Servicios con campos adicionales
special_services = []
special_services << Service.create(name: "Retraso del servicio")
special_services << Service.create(name: "Robo de medidor")
special_services.each do |c|
  c.service_fields.create(name: "Numero de cuenta")
  c.service_fields.create(name: "Nombre del titular")
end

# Crear mensajes iniciales para cada status
Service.all.each do |service|
  service.messages.create(status_id: open_status.id, content: 'Mensaje para status abierto')
  service.messages.create(status_id: verification_status.id, content: 'Mensaje para status verificado')
  service.messages.create(status_id: revision_status.id, content: 'Mensaje para status revisado')
  service.messages.create(status_id: close_status.id, content: 'Mensaje para status cerrado')
end
