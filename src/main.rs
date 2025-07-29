use axum::{extract::Path, response::{Html, Json}};
use enum_router::router;
use hyped::*;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use std::net::SocketAddr;
use tailwind_fuse::*;
use tokio;
use tower_http::services::ServeDir;

#[derive(TwClass)]
#[tw(class = "flex items-center justify-center rounded-lg font-medium transition-colors")]
struct ButtonStyle {
    size: ButtonSize,
    color: ButtonColor,
}

#[derive(TwVariant)]
enum ButtonSize {
    #[tw(default, class = "h-10 px-4 py-2 text-sm")]
    Default,
    #[tw(class = "h-9 px-3 py-2 text-sm")]
    Small,
    #[tw(class = "h-11 px-8 py-2 text-base")]
    Large,
}

#[derive(TwVariant)]
enum ButtonColor {
    #[tw(default, class = "bg-nord0 text-nord4 hover:bg-nord1")]
    Primary,
    #[tw(class = "bg-nord11 text-nord6 hover:bg-nord12")]
    Danger,
    #[tw(class = "bg-nord14 text-nord0 hover:bg-nord13")]
    Success,
}

#[derive(Serialize, Deserialize)]
struct User {
    id: u32,
    name: String,
    email: String,
}

fn render_to_string(element: Element) -> String {
    render((
        doctype(),
        html((
            head((
                title("TwoP.me - Rust Web App"),
                meta().charset("utf-8"),
                link("").rel("stylesheet").href("/assets/app.css"),
            )),
            body(element),
        )),
    ))
}

fn create_button_html(button_style: &ButtonStyle, text: String) -> Element {
    element("button", text).class(&button_style.to_class())
}

async fn root() -> Html<String> {
    let primary_btn = ButtonStyle {
        size: ButtonSize::Default,
        color: ButtonColor::Primary,
    };
    
    let danger_btn = ButtonStyle {
        size: ButtonSize::Small,
        color: ButtonColor::Danger,
    };

    let success_btn = ButtonStyle {
        size: ButtonSize::Large,
        color: ButtonColor::Success,
    };

    let page_content = div((
        h1("Welcome to TwoP.me").class("text-4xl font-bold text-nord6 mb-8 text-center"),
        
        div((
            div((
                h2("Tailwind Fuse + Hyped + Axum Demo").class("text-2xl font-semibold text-nord8 mb-4"),
                
                p("This page demonstrates the integration of tailwind-fuse for type-safe CSS classes, hyped for HTML generation, and axum for HTTP handling.").class("text-nord5 mb-6"),
                
                div((
                    create_button_html(&primary_btn, "Primary Button".to_string()),
                    create_button_html(&danger_btn, "Danger Button".to_string()),
                    create_button_html(&success_btn, "Success Button".to_string()),
                )).class("flex flex-wrap gap-4"),
            )).class("bg-nord0 p-6 rounded-lg"),
            
            div((
                h3("Available Routes").class("text-xl font-semibold text-nord7 mb-3"),
                
                ul((
                    li(a("/ - This homepage").href(&Route::Root.to_string()).class("text-nord8 hover:text-nord9")),
                    li(a("/hello/:name - Personalized greeting").href(&Route::Hello("world".to_string()).to_string()).class("text-nord8 hover:text-nord9")),
                    li(a("/api/users - JSON API example").href(&Route::ApiUsers.to_string()).class("text-nord8 hover:text-nord9")),
                    li(a("/api/status - Status endpoint").href(&Route::ApiStatus.to_string()).class("text-nord8 hover:text-nord9")),
                )).class("space-y-2 text-nord4"),
            )).class("bg-nord1 p-6 rounded-lg"),
        )).class("max-w-4xl mx-auto space-y-6"),
    )).class("min-h-screen bg-nord0-dark text-nord4 p-8");

    Html(render_to_string(page_content))
}

async fn hello(Path(name): Path<String>) -> Html<String> {
    let greeting_page = div(
        div((
            h1(format!("Hello, {}! 👋", name)).class("text-3xl font-bold text-nord14 mb-4"),
            
            p("Welcome to our Rust-powered web application!").class("text-nord5 mb-6"),
            
            a("← Back to Home")
                .href(&Route::Root.to_string())
                .class("bg-nord8 text-nord0 px-4 py-2 rounded hover:bg-nord9 transition-colors"),
        )).class("bg-nord0 p-8 rounded-lg text-center max-w-md")
    ).class("min-h-screen bg-nord0-dark text-nord4 p-8 flex items-center justify-center");

    Html(render_to_string(greeting_page))
}

async fn api_users() -> Json<Value> {
    let users = vec![
        User { id: 1, name: "Alice".to_string(), email: "alice@twop.me".to_string() },
        User { id: 2, name: "Bob".to_string(), email: "bob@twop.me".to_string() },
        User { id: 3, name: "Carol".to_string(), email: "carol@twop.me".to_string() },
    ];

    Json(json!({
        "users": users,
        "total": users.len(),
        "message": "Users fetched successfully"
    }))
}

async fn api_status() -> Json<Value> {
    Json(json!({
        "status": "healthy",
        "server": "twop.me",
        "framework": "axum",
        "html_engine": "hyped",
        "css_framework": "tailwind + tailwind_fuse",
        "theme": "nord"
    }))
}

#[router]
pub enum Route {
    #[get("/")]
    Root,
    #[get("/hello/{name}")]
    Hello(String),
    #[get("/api/users")]
    ApiUsers,
    #[get("/api/status")]
    ApiStatus,
}

#[tokio::main]
async fn main() {
    println!("🚀 Starting TwoP.me server...");

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    println!("📡 Server running at http://{}", addr);
    println!("🎨 Using Nord theme with Tailwind CSS");
    println!("⚡ Powered by Enum Router + Hyped + Tailwind Fuse");

    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    
    // Create the main router with enum_router
    let app_router = Route::router();
    
    // Add static file serving for assets
    let router = app_router.nest_service("/assets", ServeDir::new("assets"));
    
    axum::serve(listener, router).await.unwrap();
}
