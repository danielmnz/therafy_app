# Architecture Decision Record (ADR) - PoC shared_prefences

## Contexto (Riesgo evaluado)
La aplicación requiere almacenar cambios simples en la configuración del usuario, cambios locales o de preferencia de la interfaz, como por ejemplo el modo oscuro, tamaño del texto y/o notificaciones, todo esto sin depender de conexión a internet o una base de datos externa para cumplir dicho requerimiento.

El riesgo evaluado correponde a verificar si Flutter permite persistencia local sencilla y estable
El proyecto Therafy requiere almacenar configuraciones simples del usuario, como preferencias de interfaz (ej. modo oscuro, tamaño de texto o notificaciones), sin depender de conexión a internet o bases de datos externas.

El riesgo evaluado corresponde a verificar si Flutter permite la persistencia local sencilla de forma estable, sin necesidad de implementar un backend adicional. Se busca que la información se mantenga guardada al cerrar y volver a abrir la aplicación.

---

## Decisión (Librería adoptada)

La librería utilizada para esta ocasión fue shared_preferences para almacenar configuraciones locales mediante pares key-value.

Versión utilizada:

```yaml
shared_preferences: ^2.5.5
```

---

La POC se implementó directamente dentro de la pantalla SettingsScreen, sin mayor arquitectura o diseño UI adicional, para ver la validación funcional del paquete. Es por ello que se reemplazó uno de los ListTile que había por un SwitchListTile que mostraría un botón tipo switch para un valor booleano llamado modoOscuro, que permitiría modificar dicha preferencia a gusto, esta se guarda y recupera automáticamente.

### Funcionalidades probadas
- Guarda valor booleano (true/false)
- Recuperar valor al iniciar la aplicación
- Persistencia después de recargar la app.

---

## Consecuencias
La POC funcionó correctamente, ya que se comprobó que
- Los datos se mantienen después de cerrar o recargar la app
- La librería shared_preferences es suficiente para configurar preferencias locales simples
- No es necesario Firebase en este caso

### Impacto en el proyecto
- Reduce complejidad dle sistema para preferencias simples
- Mejora rendimiento al no depender de servicios externos adicionales.

### Integración futura a la rama principal
- Separación de lo realizado en servicios (como StorageService)
- Uso de los ViewModels (MVVM)
- Manejo de estado con el Provider