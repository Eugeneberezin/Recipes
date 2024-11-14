# Recipe App

This project is a recipe app designed to showcase core skills in SwiftUI, Swift Concurrency, and handling data from an API in a responsive, efficient way. The app fetches and displays recipes on a single screen, meeting the provided requirements with a focus on clean architecture, error handling, and testability.

---

## How to Run the App

1. **Clone the Repository**:
    
    ```bash
    bash
    Copy code
    git clone [your-repo-url]
    
    ```
    
2. **Open in Xcode**:
    - Navigate to the project folder and open the `.xcodeproj` file in Xcode.
3. **Run the App**:
    - Select an iOS simulator or a connected device, then click `Run` in Xcode. The app should launch, displaying a list of recipes.

---

## Requirements Fulfilled

Each of the key requirements has been implemented as follows:

- **Display Recipe Data**: Each recipe entry displays its name, cuisine type, and a thumbnail image, as specified.
- **UI Refresh**: The app uses pull-to-refresh functionality, allowing the user to manually reload data.
- **Efficient Network Usage**: Data is fetched only when needed, and images load lazily as they appear on screen to reduce bandwidth usage.
- **Data Handling (No Disk Storage)**: Recipe data is stored in memory only, fetched either at launch or when the user refreshes.
- **Error Handling**: Graceful error handling is included for cases of malformed data, empty datasets, and network issues, displaying informative messages to the user.
- **Image Caching**: The app uses `AsyncImage` for image loading, which provides basic caching and lazy loading.

---

## Focus Areas

This project is structured to highlight several key areas:

1. **Architecture**:
    - Follows MVVM (Model-View-ViewModel) architecture, promoting separation of concerns and maintainability.
    - Uses dependency injection for the network layer, improving testability and enabling easy substitution of services in tests or future development.
2. **Concurrency**:
    - Swift’s `async/await` is used to handle network calls efficiently, ensuring that the UI remains responsive even when fetching data.
3. **UI/UX**:
    - The app has a single-screen UI, with a pull-to-refresh feature and clear error messaging to enhance the user experience.
    - Error messages inform users of any issues with fetching data rather than leaving the screen blank.
4. **Performance Optimization**:
    - Images load only as they appear on screen, saving bandwidth and improving performance.
    - Data is only fetched when necessary, with no storage on disk, to keep the app lightweight and responsive.

---

## Time Spent

- **Total Time**: Approximately 5 hours.
- **Time Breakdown**:
    - **Project Setup and Structure**: 1 hour
    - **Networking and Error Handling**: 1.5 hours
    - **UI Development**: 1 hour
    - **Unit Testing and Mocking**: 1 hour
    - **Documentation and Code Review**: 30 minutes

---

## Trade-offs and Decisions

1. **Image Caching**:
    - SwiftUI’s `AsyncImage` is used for basic lazy loading and caching. To fully optimize image caching (including disk persistence), a dedicated library like SDWebImage or Kingfisher could be added in the future.
2. **Error Handling Granularity**:
    - The app includes detailed error handling for network requests and decoding issues, allowing graceful fallback in common failure scenarios.
3. **Single-Screen Scope**:
    - The app focuses on listing recipes on a single screen as per the requirements. Adding a detailed view for each recipe could be a logical next step if the scope were extended.

---

## Potential Areas for Improvement

- **Enhanced Image Caching**: The current implementation relies on `AsyncImage`, which handles image caching in memory but not on disk. Integrating a library like SDWebImage or Kingfisher could improve image caching by adding disk storage capabilities.

---

## Testing Approach

The unit tests focus on `RecipesViewModel`, with a `MockRecipeService` to simulate network responses. This allows us to verify correct behavior in scenarios including successful data fetch, empty data, and error handling.

- **Mocking Success and Error Scenarios**: `MockRecipeService` simulates various network responses, enabling controlled testing of the view model without live network calls.
- **Unit Tests**: Core data flow and error handling are tested thoroughly. Dependency injection ensures that the view model can be tested independently of the actual networking code.

---

## External Code and Dependencies

- **SwiftUI’s AsyncImage**: Used for basic image loading and caching.

No additional dependencies were included.

---

## Final Notes

This project meets the outlined requirements and demonstrates core skills in SwiftUI, Swift Concurrency, and modular, testable code. The codebase is designed to be scalable and maintainable, with a clear separation of concerns to facilitate future feature development or refactoring.

Thank you for reviewing this project. If you have any questions or feedback, please feel free to reach out!
