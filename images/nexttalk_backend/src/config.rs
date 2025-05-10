use std::env;


pub fn get_port() -> u16 {
    env::var("PORT")
        .unwrap_or_else(|_| "8000".to_string())
        .parse()
        .expect("PORT must be a valid number")
}

pub fn pg_conn_str() -> String {
    let user = env::var("PG_USER").expect("PG_USER must be set");
    let password = env::var("PG_PASSWORD").expect("PG_PASSWORD must be set");
    let db = env::var("PG_DB").expect("PG_DB must be set");
    let host = env::var("PG_HOST").unwrap_or_else(|_| "localhost".into());
    let port = env::var("PG_PORT").unwrap_or_else(|_| "5432".into());

    format!(
        "host={} user={} password={} dbname={} port={}",
        host, user, password, db, port
    )
}
