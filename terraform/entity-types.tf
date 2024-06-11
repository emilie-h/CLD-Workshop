# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


resource "google_dialogflow_cx_entity_type" "city" {
  display_name = "City"
  kind         = "KIND_MAP"
  parent        = google_dialogflow_cx_agent.agent.id

  entities {
    value = "New York"
    synonyms = ["NYC", "New York City", "New York"]
  }
  entities {
    value = "Los Angeles"
    synonyms = ["LA", "Los Angeles"]
  }
}

resource "google_dialogflow_cx_entity_type" "date" {
  display_name = "Date"
  kind         = "KIND_MAP"
  parent        = google_dialogflow_cx_agent.agent.id

    entities {
        value = "2023-01-01"
      synonyms = ["New Year's Day", "January 1st", "2023-01-01"]
    }
}

resource "google_dialogflow_cx_entity_type" "airline" {
  display_name = "Airline"
  kind         = "KIND_MAP"
  parent        = google_dialogflow_cx_agent.agent.id

  entities {
    value = "American Airlines"
    synonyms = ["AA", "American Airlines"]
  }
  entities {
    value = "Delta Airlines"
    synonyms = ["Delta Airlines", "Delta"]
  }
}


