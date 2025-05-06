use tokio_postgres::{Client, NoTls, Error};
use crate::config;

pub async fn init_pg_client() -> Result<Client, Error> {
    let conn_str = config::pg_conn_str();

    let (client, connection) = tokio_postgres::connect(&conn_str, NoTls).await?;

    // Spawn the connection to run in the background
    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("❌ PostgreSQL connection error: {}", e);
        }
    });

    Ok(client)
}
