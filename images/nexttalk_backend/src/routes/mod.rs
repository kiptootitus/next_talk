use axum::{Router, routing::get};
use std::sync::Arc;
use tokio::sync::Mutex;
use tokio_postgres::Client;

use crate::handlers::user_handler::get_user_names;

pub fn init_routes(db: Arc<Mutex<Client>>) -> Router {
    Router::new()
    .route("/users/names", get(get_user_names).with_state(db))

}
