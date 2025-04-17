// API Service for MediQ
const API_BASE_URL = 'https://api.mediq.com/v1';

// Email validation regex
const EMAIL_REGEX = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

// Mock user database (in a real app, this would be on the server)
let users = [
    {
        id: 1,
        name: 'Sapnil Ahmed',
        email: 'sapnilasikmim@gmail.com',
        phone: '+880 123456789',
        password: 'SapnilAsikMim' // In real app, this would be hashed
    }
];

// API Service Class
class ApiService {
    // Validate email format
    validateEmail(email) {
        return EMAIL_REGEX.test(email);
    }

    // Validate password strength
    validatePassword(password) {
        return password.length >= 6;
    }

    // Register a new user
    async register(userData) {
        try {
            // Validate email format
            if (!this.validateEmail(userData.email)) {
                throw new Error('Please enter a valid email address');
            }

            // Validate password strength
            if (!this.validatePassword(userData.password)) {
                throw new Error('Password must be at least 6 characters long');
            }

            // Check if user already exists
            const existingUser = users.find(user => user.email === userData.email);
            if (existingUser) {
                throw new Error('An account with this email already exists');
            }

            // Create new user
            const newUser = {
                id: users.length + 1,
                ...userData
            };
            users.push(newUser);

            // In a real app, this would be an API call
            return {
                success: true,
                message: 'Registration successful! Please login with your credentials.',
                user: {
                    id: newUser.id,
                    name: newUser.name,
                    email: newUser.email,
                    phone: newUser.phone
                }
            };
        } catch (error) {
            throw error;
        }
    }

    // Login user
    async login(email, password) {
        try {
            // Validate email format
            if (!this.validateEmail(email)) {
                throw new Error('Please enter a valid email address');
            }

            const user = users.find(user => user.email === email);
            
            if (!user) {
                throw new Error('No account found with this email');
            }

            if (user.password !== password) {
                throw new Error('Incorrect password');
            }

            // In a real app, this would be an API call
            return {
                success: true,
                message: 'Login successful! Welcome back.',
                user: {
                    id: user.id,
                    name: user.name,
                    email: user.email,
                    phone: user.phone
                }
            };
        } catch (error) {
            throw error;
        }
    }

    // Get user profile
    async getUserProfile(userId) {
        try {
            const user = users.find(user => user.id === userId);
            if (!user) {
                throw new Error('User not found');
            }

            return {
                success: true,
                user: {
                    id: user.id,
                    name: user.name,
                    email: user.email,
                    phone: user.phone
                }
            };
        } catch (error) {
            throw error;
        }
    }
}

// Create and export API service instance
const apiService = new ApiService(); 