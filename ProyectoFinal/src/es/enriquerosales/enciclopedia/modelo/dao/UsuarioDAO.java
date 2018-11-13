package es.enriquerosales.enciclopedia.modelo.dao;

import es.enriquerosales.enciclopedia.modelo.Usuario;

/**
 * Interfaz DAO para actuar como capa intermedia entre el modelo Java y la base
 * de datos para la clase {@link Usuario}.
 * 
 * @author Enrique Rosales
 *
 */
public interface UsuarioDAO {

	/**
	 * Busca un {@link Usuario} en el sistema a partir del nombre de usuario y la
	 * contraseņa proporcionados.
	 * 
	 * @param nombreUsuario
	 *            El nombre de usuario a buscar.
	 * @param contrasenna
	 *            La contraseņa del usuario.
	 * @return Una instancia de {@link Usuario}, o {@code null} si no existe.
	 */
	Usuario buscarUsuario(String nombreUsuario, String contrasenna) throws DAOException;

	/**
	 * Busca un {@link Usuario} en el sistema a partir del ID proporcionado.
	 * 
	 * @param id
	 *            El ID del usuario a buscar.
	 * @return Una instancia de {@link Usuario}, o {@code null} si no existe.
	 */
	Usuario buscarUsuario(int id) throws DAOException;

}
