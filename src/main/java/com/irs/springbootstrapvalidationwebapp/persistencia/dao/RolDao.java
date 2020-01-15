package com.irs.springbootstrapvalidationwebapp.persistencia.dao;

import com.irs.springbootstrapvalidationwebapp.negocio.vo.RolVO;
import com.irs.springbootstrapvalidationwebapp.persistencia.dao.exceptions.DaoException;
import java.util.List;

/**
 * Interface de la capa de persistencia empleada para los roles.
 *
 * @author IRS
 * @version 1.0.0
 */
public interface RolDao {

    /**
     * Selecciona todos los roles ordenados por nombre.
     *
     * @return Una colección de roles ordenados por nombre.
     * @throws DaoException Si se produce algún error en la selección.
     */
    List<RolVO> selectAll() throws DaoException;
}
