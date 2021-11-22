# examen-ios

## Preguntas 🧐
### Explique el ciclo de vida de un ViewController
### Explique el ciclo de vida de una aplicación
### En que casos se usa un weak, un strong y un unowned
- Si se está seguro de que el valor capturado permanecera en todo momento del ciclo de vida del closure, es posible utilizar **unowned**. Esto es solo para cuando weak cause problemas al ser utilizado, incluso si se utiliza guard let dentro del closure con una variable weak capturada._
- Si se tiene una referencia strong donde *A* posee a *B* y *B* posee a *A*, una de las dos debería ser una referencia **weak**. Esto usualmente sería cualquiera que sea destruida primero, entonces si el viewController *A* presenta al ViewController B, el ViewController B debería de ser una referencia **weak** de A._
- Si no hay posibiidad de tener un ciclado de referencias *strong* es posible utilizar una captura **strong**._

### ¿Qué es el ARC?
_Es la solución de apple para liberar memoria utilizada por una clase cuando éste no vaya a ser utiizado nunca más. Como un recolector de basura. (Automatic Reference Counting)_
### Punto Extra
_Tomando en cuenta las capturas de código, mensiona cuál será el color de la vista del ViewController que será mostrado en ejecución de la app._
_El color del ViewController será rojo ya que primero se ejecuta:_
```
  func application(..., didFinishLaunchingWithOptions ...){
      ...
      viewController.view.backgroundColor = UIColor.yellow
      ...
  }
```
_Este proceso ocurre en el proceso de InitNibName, por lo cual, todavía no se carga la vista hasta cuando es llamado por window.rootViewController_
_Posteriormente a eso al llegar al ViewController nos encontramos con la función viewDidLoad()_
```
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.red
  }
```
_Esto es llamado en la sección de LoadView antes de presentar la vista (willDidAppear)._
