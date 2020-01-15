package com.irs.springbootstrapvalidationwebapp.negocio.servicios;

import com.irs.springbootstrapvalidationwebapp.negocio.servicios.exceptions.ServiceException;
import com.irs.springbootstrapvalidationwebapp.negocio.vo.RolVO;
import java.util.List;

/**
 * Interface de la lógica de negocio empleada para los roles.
 *
 * @author IRS
 * @version 1.0.0
 */
public interface RolService {

    List<RolVO> findAll() throws ServiceException;
}
