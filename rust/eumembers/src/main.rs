use std::env;
use std::process;
use std::path::Path;
use csv::Error;
use std::fmt;

#[derive(Debug, Eq, Ord, PartialEq, PartialOrd)]
enum EventType {
    JoinedUnion,
    JoinedEurozone,
    JoinedSchengen,
    ExitedUnion,
}

impl fmt::Display for EventType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match *self {
            EventType::JoinedUnion => write!(f, "joined the European Union"),
            EventType::JoinedEurozone => write!(f, "joined the eurozone"),
            EventType::JoinedSchengen => write!(f, "joined the Schengen treaty"),
            EventType::ExitedUnion => write!(f, "withdrew from the European Union"),
        }
    }
}

fn make_list_string(items: Vec<&str>) -> String {
    match items.len() {
        0 => "".to_string(),
        1 => items[0].to_string(),
        2 => [&items[0], " and ", &items[1]].concat(),
        _ => {
            let last_index = items.len() - 1;
            [items[0], ", ", &items[1..last_index].join(", ").to_string(), " and ", &items[last_index].to_string()].concat()
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn text_make_list_string_empty() {
        let vec = Vec::<&str>::new();
        assert_eq!(make_list_string(vec), "");
    }

    #[test]
    fn text_make_list_string_one() {
        let mut vec = Vec::<&str>::new();
        vec.push("One");
        assert_eq!(make_list_string(vec), "One");
    }

    #[test]
    fn text_make_list_string_two() {
        let mut vec = Vec::<&str>::new();
        vec.push("One");
        vec.push("Two");
        assert_eq!(make_list_string(vec), "One and Two");
    }

    #[test]
    fn text_make_list_string_three() {
        let mut vec = Vec::<&str>::new();
        vec.push("One");
        vec.push("Two");
        vec.push("Three");
        assert_eq!(make_list_string(vec), "One, Two and Three");
    }

    #[test]
    fn text_make_list_string_more_than_three() {
        let mut vec = Vec::<&str>::new();
        vec.push("One");
        vec.push("Two");
        vec.push("Three");
        vec.push("Four");
        assert_eq!(make_list_string(vec), "One, Two, Three and Four");
    }
}

#[derive(Debug, Eq, Ord, PartialEq, PartialOrd)]
struct Event {
    country_code: String,
    event_type: EventType,
    date: String,
}

fn main() -> Result<(), Error> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {  // no path
        println!("Please give a path for the CSV data files");
        process::exit(1);
    }

    let path = Path::new(&args[1]);
    println!("Path = {:?}", path);

    let mut events = Vec::<Event>::new();

    let mut reader = csv::ReaderBuilder::new().has_headers(true).from_path(path.join("membership.csv")).expect("Cannot read CSV file");
    for record in reader.records() {
        let record = record?;

        let country_code = &record[0];
        let union_date = &record[1];
        let euro_date = &record[2];
        let schengen_date = &record[3];
        let exit_date = &record[4];

        println!("country_code = {}, union_date = {}, euro_date = {}, schengen_date = {}, exit_date = {}",
            country_code, union_date, euro_date, schengen_date, exit_date);

        let joined_union_event = Event {
            country_code: country_code.to_string(),
            event_type: EventType::JoinedUnion,
            date: union_date.to_string(),
        };
        events.push(joined_union_event);

        if euro_date != "" {
            let joined_eurozone_event = Event {
                country_code: country_code.to_string(),
                event_type: EventType::JoinedEurozone,
                date: euro_date.to_string(),
            };
            events.push(joined_eurozone_event);
        }

        if schengen_date != "" {
            let joined_schengen_event = Event {
                country_code: country_code.to_string(),
                event_type: EventType::JoinedSchengen,
                date: schengen_date.to_string(),
            };
            events.push(joined_schengen_event);
        }

        if exit_date != "" {
            let exited_union_event = Event {
                country_code: country_code.to_string(),
                event_type: EventType::ExitedUnion,
                date: exit_date.to_string(),
            };
            events.push(exited_union_event);
        }

    }    

    // We can sort the events by date because the Event struct and its members 
    // have the necessary traits to be sortable.
    events.sort_by(|a, b| a.date.cmp(&b.date));

    for event in events {
        println!("{} {} {}", event.country_code, event.date, event.event_type);
    }

    Ok(())
}
