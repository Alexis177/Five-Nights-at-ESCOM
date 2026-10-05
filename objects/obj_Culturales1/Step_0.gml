if (global.EnergyBlackout) exit;
/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 38E05DF0
/// @DnDArgument : "var" "global.CambioCamara"
if(global.CambioCamara == 0)
{
	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 1BC6161D
	/// @DnDParent : 38E05DF0
	/// @DnDArgument : "code" "var umbral = 325; // Umbral en píxeles para activar el scroll (puedes ajustarlo)$(13_10)var max_x = room_width - sprite_width; // Límite derecho donde el fondo no puede ir más allá$(13_10)$(13_10)var mx = room_width / 2.0 - mouse_x;$(13_10)$(13_10)// Control del scroll: solo cuando el mouse está cerca de los bordes$(13_10)if (mouse_x < umbral) { // Si el mouse está cerca del borde izquierdo$(13_10)    x += mx * global.rotacionvel;$(13_10)    if (x >= 0) {$(13_10)        global.ShowButton = 1; // Mostrar el botón cuando se está en la parte izquierda del sprite$(13_10)    }$(13_10)} else if (mouse_x > room_width - umbral) { // Si el mouse está cerca del borde derecho$(13_10)    x += mx * global.rotacionvel;$(13_10)    global.ShowButton = 0; // El botón desaparece al llegar al borde derecho$(13_10)} else {$(13_10)    // Si no está en el borde izquierdo o derecho, el botón se mantiene en 0 (desaparecido)$(13_10)    if (x >= 0) {$(13_10)        global.ShowButton = 1; // Si estamos en la parte izquierda del fondo, el botón aparece$(13_10)    } else {$(13_10)        global.ShowButton = 0; // Si nos movemos hacia la derecha, el botón desaparece$(13_10)    }$(13_10)}$(13_10)$(13_10)// Asegúrate de que el fondo no se mueva fuera de la pantalla$(13_10)if (x > 0) {$(13_10)    x = 0;$(13_10)    global.ShowButton = 1; // Mostrar el botón cuando el fondo está completamente a la izquierda$(13_10)} else if (x < max_x) {$(13_10)    x = max_x;$(13_10)    global.ShowButton = 0; // El botón desaparece cuando el fondo llega al límite derecho$(13_10)}$(13_10)"
	var umbral = 325; // Umbral en píxeles para activar el scroll (puedes ajustarlo)
	var max_x = room_width - sprite_width; // Límite derecho donde el fondo no puede ir más allá
	
	var mx = room_width / 2.0 - mouse_x;
	
	// Control del scroll: solo cuando el mouse está cerca de los bordes
	if (mouse_x < umbral) { // Si el mouse está cerca del borde izquierdo
	    x += mx * global.rotacionvel;
	    if (x >= 0) {
	        global.ShowButton = 1; // Mostrar el botón cuando se está en la parte izquierda del sprite
	    }
	} else if (mouse_x > room_width - umbral) { // Si el mouse está cerca del borde derecho
	    x += mx * global.rotacionvel;
	    global.ShowButton = 0; // El botón desaparece al llegar al borde derecho
	} else {
	    // Si no está en el borde izquierdo o derecho, el botón se mantiene en 0 (desaparecido)
	    if (x >= 0) {
	        global.ShowButton = 1; // Si estamos en la parte izquierda del fondo, el botón aparece
	    } else {
	        global.ShowButton = 0; // Si nos movemos hacia la derecha, el botón desaparece
	    }
	}
	
	// Asegúrate de que el fondo no se mueva fuera de la pantalla
	if (x > 0) {
	    x = 0;
	    global.ShowButton = 1; // Mostrar el botón cuando el fondo está completamente a la izquierda
	} else if (x < max_x) {
	    x = max_x;
	    global.ShowButton = 0; // El botón desaparece cuando el fondo llega al límite derecho
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 2FC682F5
else
{

}