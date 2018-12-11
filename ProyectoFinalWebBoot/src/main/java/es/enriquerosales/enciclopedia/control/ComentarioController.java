package es.enriquerosales.enciclopedia.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import es.enriquerosales.enciclopedia.modelo.Comentario;
import es.enriquerosales.enciclopedia.modelo.Personaje;
import es.enriquerosales.enciclopedia.modelo.Usuario;
import es.enriquerosales.enciclopedia.servicio.ComentarioService;

/**
 * Clase controlador para realizar tareas relacionadas con comentarios.
 * 
 * @author Enrique Rosales
 *
 */
@Controller
public class ComentarioController {

	@Autowired
	private ComentarioService comentarioService;

	/**
	 * Publica un nuevo {@link Comentario}.
	 * 
	 * @param personajeid
	 *            El ID del {@link Personaje} donde se realiza la publicación.
	 * @param comentario
	 *            El comentario a publicar.
	 * @param session
	 *            La sesión HTTP en ejecución.
	 * @return Una cadena que representa la página de destino.
	 */
	@PostMapping("/publicar")
	public String publicar(@RequestParam Integer personajeid,
			@RequestParam String comentario, HttpSession session) {
		try {
			Personaje personaje = new Personaje();
			personaje.setId(personajeid);
			Usuario usuario = (Usuario) session.getAttribute("user");
			comentarioService.publicar(usuario, personaje, comentario);
			// Volver a la página donde se estaba
			return "redirect:/verPersonaje?id=" + personajeid;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * Elimina un {@link Comentario}.
	 * 
	 * @param comentario
	 *            El {@link Comentario} a eliminar.
	 * @param personaje
	 *            El ID del {@link Personaje} en el que se está.
	 * @return Una cadena que representa la página de destino.
	 */
	@GetMapping("/eliminarComentario")
	public String eliminar(@ModelAttribute Comentario comentario,
			@RequestParam Integer personajeid) {
		try {
			comentarioService.eliminar(comentario);
			// Volver a la página donde se estaba
			return "redirect:/verPersonaje?id=" + personajeid;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

}