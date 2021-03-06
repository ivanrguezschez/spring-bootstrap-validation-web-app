package com.irs.springbootstrapvalidationwebapp.persistencia.dao;

import com.irs.springbootstrapvalidationwebapp.negocio.vo.FilterUsuarioVO;
import com.irs.springbootstrapvalidationwebapp.negocio.vo.UsuarioVO;
import com.irs.springbootstrapvalidationwebapp.persistencia.dao.exceptions.DaoException;
import java.util.List;

/**
 * Interface de la capa de persistencia empleada para los usuarios.
 *
 * @author IRS
 * @version 1.0.0
 */
public interface UsuarioDao {

    List<UsuarioVO> selectByFilter(final FilterUsuarioVO filterUsuario) throws DaoException;
    
    UsuarioVO selectById(Integer idUsuario) throws DaoException;

    UsuarioVO insert(UsuarioVO usuario) throws DaoException;

    void update(UsuarioVO usuario) throws DaoException;

    void delete(UsuarioVO usuario) throws DaoException;
}
