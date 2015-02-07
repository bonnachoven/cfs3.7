//Name:Xu Zhao
//Andrew ID:xuzhao
//Course Number:08600
//Date:12/05/2014
package model;

//import java.util.Arrays;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import databean.Fund;

public class FundDAO extends GenericDAO<Fund> {
	public FundDAO(ConnectionPool cp, String tableName) throws DAOException {
		super(Fund.class, tableName, cp);
	}

	public Fund[] getFunds() throws RollbackException {
		Fund[]funds = match();
		// We want them sorted by last and first names (as per
		// User.compareTo());
		return funds;
	}
	
	public Fund getFunds(String name) throws RollbackException {
		Fund[] funds = match(MatchArg.equals("name", name));
		if (funds.length == 0) {
			return null;
		}
		else {
			return funds[0];
		}

	}
	
	public Fund getFunds(int id) throws RollbackException {
		Fund[] funds = match(MatchArg.equals("fund_id", id));
		if (funds.length == 0) {
			return null;
		}
		else {
			return funds[0];
		}

	}
}
