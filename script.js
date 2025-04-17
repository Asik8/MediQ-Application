// Remove the import statement since we're not using modules
// import apiService from './api.js';

document.addEventListener('DOMContentLoaded', function() {
    // Navigation functionality
    const navLinks = document.querySelectorAll('.main-nav a');
    const pages = document.querySelectorAll('.page');
    
    // DOM elements
    const loginContainer = document.getElementById('loginContainer');
    const appContainer = document.getElementById('appContainer');
    const loginBtn = document.getElementById('loginBtn');
    const logoutBtn = document.querySelector('.logout-btn');
    const registerContainer = document.getElementById('registerContainer');
    const showRegisterLink = document.getElementById('showRegister');
    const showLoginLink = document.getElementById('showLogin');
    const registerBtn = document.getElementById('registerBtn');
    
    // Check if user is already logged in
    const currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if (currentUser) {
        showApp();
        updateProfileInfo(currentUser);
        showNotification('Welcome back!', 'success');
    }
    
    // Login functionality
    loginBtn.addEventListener('click', async function() {
        const email = document.getElementById('loginEmail').value;
        const password = document.getElementById('loginPassword').value;
        
        // Clear any existing notifications
        clearNotifications();
        
        try {
            const response = await apiService.login(email, password);
            if (response.success) {
                // Store user data in localStorage
                localStorage.setItem('currentUser', JSON.stringify(response.user));
                showApp();
                updateProfileInfo(response.user);
                showNotification(response.message, 'success');
            }
        } catch (error) {
            showNotification(error.message, 'error');
        }
    });
    
    // Logout functionality
    logoutBtn.addEventListener('click', function() {
        localStorage.removeItem('currentUser');
        showLogin();
        showNotification('Logged out successfully', 'success');
    });
    
    // Show the app (hide login)
    function showApp() {
        loginContainer.style.display = 'none';
        registerContainer.style.display = 'none';
        appContainer.style.display = 'block';
        showPage('home');
    }
    
    // Show login (hide app)
    function showLogin() {
        loginContainer.style.display = 'flex';
        registerContainer.style.display = 'none';
        appContainer.style.display = 'none';
        // Clear login form
        document.getElementById('loginEmail').value = '';
        document.getElementById('loginPassword').value = '';
    }
    
    // Page navigation functionality
    function showPage(pageId) {
        // Hide all pages
        pages.forEach(page => page.classList.remove('active'));
        
        // Show selected page
        const pageToShow = document.getElementById(pageId);
        if (pageToShow) {
            pageToShow.classList.add('active');
        }
        
        // Update active nav link
        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('data-page') === pageId) {
                link.classList.add('active');
            }
        });
        
        // Scroll to top
        window.scrollTo(0, 0);
    }
    
    // Navigation click handlers
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const pageId = this.getAttribute('data-page');
            showPage(pageId);
        });
    });
    
    // Quick Actions functionality
    document.getElementById('priceActionBtn')?.addEventListener('click', function() {
        showPage('price');
    });
    
    document.getElementById('pharmacyActionBtn')?.addEventListener('click', function() {
        showPage('pharmacy');
    });
    
    document.getElementById('reminderActionBtn')?.addEventListener('click', function() {
        showPage('reminder');
    });
    
    // Reminder buttons functionality
    const reminderButtons = [
        document.getElementById('headerReminderBtn'),
        document.getElementById('floatingReminderBtn')
    ].filter(btn => btn !== null);
    
    reminderButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            showPage('reminder');
        });
    });
    
    // Profile button functionality
    document.getElementById('headerProfileBtn')?.addEventListener('click', function() {
        showPage('profile');
    });
    
    // Save reminder functionality
    const saveReminderBtn = document.querySelector('.save-reminder-btn');
    if (saveReminderBtn) {
        saveReminderBtn.addEventListener('click', function() {
            const medicineName = document.getElementById('medicineName').value;
            const dosage = document.getElementById('dosage').value;
            const time = document.getElementById('time').value;
            const frequency = document.getElementById('frequency').value;
            const startDate = document.getElementById('startDate').value;
            const notes = document.getElementById('notes').value;
            
            if (medicineName && dosage && time && startDate) {
                // Create new reminder item
                const reminderList = document.querySelector('.reminder-list');
                const newReminder = document.createElement('li');
                
                // Generate unique ID for the checkbox
                const reminderId = 'reminder-' + Date.now();
                
                newReminder.innerHTML = `
                    <input type="checkbox" id="${reminderId}">
                    <label for="${reminderId}">${medicineName} <span>${time} - ${dosage}</span></label>
                `;
                
                // Add to the top of the list
                reminderList.insertBefore(newReminder, reminderList.firstChild);
                
                // Add checkbox functionality
                newReminder.querySelector('input[type="checkbox"]').addEventListener('change', function() {
                    const label = this.nextElementSibling;
                    if (this.checked) {
                        label.style.textDecoration = 'line-through';
                        label.style.color = '#999';
                    } else {
                        label.style.textDecoration = 'none';
                        label.style.color = '#333';
                    }
                });
                
                // Show success message and go to home page
                alert(`Reminder set for ${medicineName} (${dosage}) at ${time} starting ${startDate}`);
                showPage('home');
                
                // Clear form
                document.getElementById('medicineName').value = '';
                document.getElementById('dosage').value = '';
                document.getElementById('time').value = '';
                document.getElementById('startDate').value = '';
                document.getElementById('notes').value = '';
            } else {
                alert('Please fill in all required fields (Medicine Name, Dosage, Time, and Start Date)');
            }
        });
    }

    // Show register form
    showRegisterLink.addEventListener('click', function(e) {
        e.preventDefault();
        loginContainer.style.display = 'none';
        registerContainer.style.display = 'flex';
        // Clear any existing notifications
        clearNotifications();
    });

    // Show login form
    showLoginLink.addEventListener('click', function(e) {
        e.preventDefault();
        registerContainer.style.display = 'none';
        loginContainer.style.display = 'flex';
        // Clear any existing notifications
        clearNotifications();
    });

    // Register button click handler
    registerBtn.addEventListener('click', async function() {
        const name = document.getElementById('registerName').value;
        const email = document.getElementById('registerEmail').value;
        const phone = document.getElementById('registerPhone').value;
        const password = document.getElementById('registerPassword').value;
        const confirmPassword = document.getElementById('registerConfirmPassword').value;
        
        // Clear any existing notifications
        clearNotifications();
        
        // Validate form
        if (!name || !email || !phone || !password || !confirmPassword) {
            showNotification('Please fill in all fields', 'error');
            return;
        }

        if (password !== confirmPassword) {
            showNotification('Passwords do not match', 'error');
            return;
        }

        try {
            const response = await apiService.register({
                name,
                email,
                phone,
                password
            });

            if (response.success) {
                showNotification(response.message, 'success');
                // Switch to login form
                registerContainer.style.display = 'none';
                loginContainer.style.display = 'flex';
                // Clear registration form
                document.getElementById('registerName').value = '';
                document.getElementById('registerEmail').value = '';
                document.getElementById('registerPhone').value = '';
                document.getElementById('registerPassword').value = '';
                document.getElementById('registerConfirmPassword').value = '';
            }
        } catch (error) {
            showNotification(error.message, 'error');
        }
    });

    // Helper functions
    function updateProfileInfo(user) {
        document.getElementById('profileName').textContent = user.name;
        document.getElementById('profileEmail').textContent = user.email;
        document.getElementById('profilePhone').textContent = user.phone;
    }

    function showNotification(message, type) {
        // Create notification element
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        
        // Add icon based on type
        const icon = document.createElement('i');
        icon.className = type === 'success' ? 'fas fa-check-circle' : 'fas fa-exclamation-circle';
        notification.appendChild(icon);
        
        // Add message
        const messageSpan = document.createElement('span');
        messageSpan.textContent = message;
        notification.appendChild(messageSpan);
        
        // Add close button
        const closeBtn = document.createElement('button');
        closeBtn.className = 'notification-close';
        closeBtn.innerHTML = '&times;';
        closeBtn.onclick = () => notification.remove();
        notification.appendChild(closeBtn);

        // Add to document
        document.body.appendChild(notification);

        // Remove after 5 seconds
        setTimeout(() => {
            if (notification.parentNode) {
                notification.remove();
            }
        }, 5000);
    }

    function clearNotifications() {
        const notifications = document.querySelectorAll('.notification');
        notifications.forEach(notification => notification.remove());
    }

    // Add notification styles
    const style = document.createElement('style');
    style.textContent = `
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 25px;
            border-radius: 5px;
            color: white;
            font-weight: 500;
            z-index: 1000;
            animation: slideIn 0.3s ease-out;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .notification.success {
            background-color: #4CAF50;
        }
        
        .notification.error {
            background-color: #f44336;
        }

        .notification i {
            font-size: 1.2em;
        }

        .notification-close {
            background: none;
            border: none;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            padding: 0 0 0 10px;
            margin-left: auto;
        }
        
        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideOut {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(100%);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(style);
});