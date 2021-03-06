/// Defines handler classes for out-of-app resources.
/// 
/// These resources include plugins that are designed to be general, not specific to the rover project.
/// By providing rover-centric APIs for these services, the app's logic becomes simpler and easier
/// to follow without having to study the specific service. Each service declared is to extend
/// the abstract [Service] class. 
/// 
/// The [Services] class acts as a bundle service for all services defined in this library. Its
/// responsibilities include initializing and disposing of the services, and it also acts as a 
/// sort of dependency injection service by ensuring simple access. 
/// 
/// This library must also be at the bottom of the dependency graph, like the data library. It may
/// not import any other library in this project, only 3rd party plugins. 
library services;

import "src/services/service.dart";

/// A dependency injection service that manages the lifecycle of other services.
/// 
/// All services must only be used by accessing them from this class, and this class will take care
/// of calling lifecycle methods like [init] while handling possibly asynchrony. 
/// 
/// To get an instance of this class, use [Services.instance]. 
class Services extends Service {
	/// The singleton instance of this class. 
	/// 
	/// This is the only instance of this class the app can guarantee is properly initialized. 
	static Services instance = Services._();

	/// This class has a private constructor since users should only use [Services.instance].
	Services._();

	@override
	Future<void> init() async { }
}
