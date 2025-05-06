use axum::{extract::State, Json, http::StatusCode};
use serde::Serialize;
use std::sync::Arc;
use tokio::sync::Mutex;
use tokio_postgres::Client;

use crate::helpers::helpersmod;

#[derive(Serialize)]
pub struct NameResponse {
    full_name: String,
}

pub async fn get_user_names(
    State(db): State<Arc<Mutex<Client>>>,
) -> Result<Json<Vec<NameResponse>>, (StatusCode, String)> {
    let db = db.lock().await;

    let rows = db
        .query("SELECT first, middle, last FROM users", &[])
        .await
        .map_err(|e| (StatusCode::INTERNAL_SERVER_ERROR, e.to_string()))?;

    let names = rows
        .iter()
        .map(|row| {
            let first: &str = row.get("first");
            let middle: &str = row.get("middle");
            let last: &str = row.get("last");
            NameResponse {
                full_name: helpersmod::get_full_name(first, middle, last),
            }
        })
        .collect();

    Ok(Json(names))
}
