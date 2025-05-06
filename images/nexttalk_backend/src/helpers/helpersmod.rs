pub fn get_full_name(first: &str, middle: &str, last: &str) -> String {
  let mut name = first.to_string();
  if !middle.is_empty() {
      name.push_str(&format!(" {}", middle));
  }
  name.push_str(&format!(" {}", last));
  name
}
