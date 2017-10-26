package cn.bukaa.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.beans.PropertyVetoException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Pool {
	private static C3P0Pool dbPool;
	private ComboPooledDataSource dataSource = new ComboPooledDataSource();

	static {
		dbPool = new C3P0Pool();
	}

	public C3P0Pool() {
		try {
			dataSource.setDriverClass("com.mysql.jdbc.Driver");
			dataSource = new ComboPooledDataSource();
			dataSource.setUser("root");
			dataSource.setPassword("root");
			dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/oya?autoReconnect=true&useUnicode=true&characterEncoding=UTF8");
			dataSource.setInitialPoolSize(2);
			dataSource.setMinPoolSize(1);
			dataSource.setMaxPoolSize(20);
			dataSource.setMaxStatements(100);
			dataSource.setMaxIdleTime(60);
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}
	}

	public final static C3P0Pool getInstance() {
		return dbPool;
	}

	public final Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException("无法从数据源获取连接", e);
		}
	}
}